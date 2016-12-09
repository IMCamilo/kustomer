package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Document.list(params), model:[documentCount: Document.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Document document) {
        respond document
    }
        
    @Secured(['ROLE_ADMIN'])
    def create() {
        def principal = springSecurityService.principal
        String username = principal.username
        respond new Document(params), model:[username:username]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save() {

        def document = new Document(params)
        document.save flush: true, failOnError: true
        redirect controller: "projectDetail", action: "show", id: document.projectId

        if (document == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (document.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond document.errors, view:'create'
            return
        }

    }

    @Secured(['ROLE_ADMIN'])
    def edit(Document document) {
        respond document
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Document document) {
        if (document == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (document.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond document.errors, view:'edit'
            return
        }

        document.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), document.id])
                redirect document
            }
            '*'{ respond document, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Document document) {

        if (document == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        document.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), document.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
