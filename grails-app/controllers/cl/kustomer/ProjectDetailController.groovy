package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectDetailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProjectDetail.list(params), model:[projectDetailCount: ProjectDetail.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(ProjectDetail projectDetail) {
        respond projectDetail
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def userList = Party.list()
        def principal = springSecurityService.principal
        String username = principal.username
        respond new ProjectDetail(params), model:[username: username, userList:userList]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(ProjectDetail projectDetail) {
        if (projectDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectDetail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectDetail.errors, view:'create'
            return
        }

        projectDetail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), projectDetail.id])
                redirect projectDetail
            }
            '*' { respond projectDetail, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(ProjectDetail projectDetail) {
        respond projectDetail
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(ProjectDetail projectDetail) {
        if (projectDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectDetail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectDetail.errors, view:'edit'
            return
        }

        projectDetail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), projectDetail.id])
                redirect projectDetail
            }
            '*'{ respond projectDetail, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(ProjectDetail projectDetail) {

        if (projectDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        projectDetail.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), projectDetail.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
