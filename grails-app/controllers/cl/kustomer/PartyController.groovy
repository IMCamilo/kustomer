package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class PartyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        if (isLoggedIn()) {
            println "====>"+getAuthenticatedUser()
            println "====>"+getPrincipal()
            println "=================================="
            getPrincipal().each {
                println it
            }

            println "=================================="
         }
        params.max = Math.min(max ?: 10, 100)
        respond Party.list(params), model:[partyCount: Party.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Party party) {
        respond party
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Party(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Party party) {
        if (party == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (party.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond party.errors, view:'create'
            return
        }

        party.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'party.label', default: 'Party'), party.id])
                redirect party
            }
            '*' { respond party, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Party party) {
        respond party
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Party party) {
        if (party == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (party.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond party.errors, view:'edit'
            return
        }

        party.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'party.label', default: 'Party'), party.id])
                redirect party
            }
            '*'{ respond party, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Party party) {

        if (party == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        party.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'party.label', default: 'Party'), party.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
