package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class RoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Role.list(params), model:[roleCount: Role.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Role role) {
        respond role
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Role(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Role role) {
        if (role == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (role.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond role.errors, view:'create'
            return
        }

        role.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), role.id])
                redirect role
            }
            '*' { respond role, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Role role) {
        respond role
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Role role) {
        if (role == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (role.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond role.errors, view:'edit'
            return
        }

        role.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), role.id])
                redirect role
            }
            '*'{ respond role, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Role role) {

        if (role == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        role.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), role.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
