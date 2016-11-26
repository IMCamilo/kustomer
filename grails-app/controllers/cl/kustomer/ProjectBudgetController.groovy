package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectBudgetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProjectBudget.list(params), model:[projectBudgetCount: ProjectBudget.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(ProjectBudget projectBudget) {
        respond projectBudget
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new ProjectBudget(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(ProjectBudget projectBudget) {
        if (projectBudget == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectBudget.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectBudget.errors, view:'create'
            return
        }

        projectBudget.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), projectBudget.id])
                redirect projectBudget
            }
            '*' { respond projectBudget, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(ProjectBudget projectBudget) {
        respond projectBudget
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(ProjectBudget projectBudget) {
        if (projectBudget == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectBudget.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectBudget.errors, view:'edit'
            return
        }

        projectBudget.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), projectBudget.id])
                redirect projectBudget
            }
            '*'{ respond projectBudget, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(ProjectBudget projectBudget) {

        if (projectBudget == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        projectBudget.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), projectBudget.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
