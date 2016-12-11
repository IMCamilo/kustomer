package cl.kustomer
import grails.plugin.springsecurity.annotation.Secured

class ClientController {

    @Secured(['ROLE_USER'])
    def index() {

    }

}