package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectTaskController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProjectTask.list(params), model:[projectTaskCount: ProjectTask.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(ProjectTask projectTask) {
        respond projectTask
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new ProjectTask(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(ProjectTask projectTask) {
        if (projectTask == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectTask.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectTask.errors, view:'create'
            return
        }

        projectTask.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'projectTask.label', default: 'ProjectTask'), projectTask.id])
                redirect projectTask
            }
            '*' { respond projectTask, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(ProjectTask projectTask) {
        respond projectTask
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(ProjectTask projectTask) {
        if (projectTask == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectTask.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectTask.errors, view:'edit'
            return
        }

        projectTask.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'projectTask.label', default: 'ProjectTask'), projectTask.id])
                redirect projectTask
            }
            '*'{ respond projectTask, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(ProjectTask projectTask) {

        if (projectTask == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        projectTask.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectTask.label', default: 'ProjectTask'), projectTask.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

@Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectTask.label', default: 'ProjectTask'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}