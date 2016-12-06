package cl.kustomer
import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    @Secured(['ROLE_ADMIN'])
    def index() {

    }

}