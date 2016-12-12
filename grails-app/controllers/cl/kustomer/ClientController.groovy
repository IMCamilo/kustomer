package cl.kustomer
import grails.plugin.springsecurity.annotation.Secured

class ClientController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {
        def auth = springSecurityService.authentication
        def authorities = auth.authorities
        boolean authenticated = auth.authenticated
        String role = authorities[0]
        if (role == 'ROLE_ADMIN') redirect(controller: "home", action: "index")
    }

}