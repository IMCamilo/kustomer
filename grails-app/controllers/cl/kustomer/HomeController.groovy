package cl.kustomer
import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def index() {
        def auth = springSecurityService.authentication
        def authorities = auth.authorities
        String role = authorities[0]
        if (role == 'ROLE_USER') redirect(controller: "client", action: "index")


        

    }

}