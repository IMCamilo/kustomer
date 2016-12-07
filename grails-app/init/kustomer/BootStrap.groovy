package kustomer
import cl.kustomer.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def rolUserStandar = new Role('ROLE_USER').save()
        def rolAdmin = new Role('ROLE_ADMIN').save()

        def camilo = new User('camilo@kustomer.cl','qwerty','18653290-2').save()
        def david = new User('david@kustomer.cl','qwerty','18611290-2').save()
        def cristian = new User('cristian@kustomer.cl','qwerty','13644290-2').save()

        UserRole.create camilo, rolAdmin
        UserRole.withSession {
            it.flush()
            it.clear()
        }

        UserRole.create david, rolUserStandar
        UserRole.withSession {
            it.flush()
            it.clear()
        }

        UserRole.create cristian, rolUserStandar
        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
}
