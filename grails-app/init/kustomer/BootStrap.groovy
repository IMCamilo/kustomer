package kustomer
import cl.kustomer.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        //roles y usuarios
        def rolUserStandar = new Role('ROLE_USER').save()
        def rolAdmin = new Role('ROLE_ADMIN').save()   
        def camilo = new User('camilo@kustomer.cl','qwerty','18653290-2').save()
        def david = new User('david@kustomer.cl','qwerty','18611290-2').save()
        def cristian = new User('cristian@kustomer.cl','qwerty','13644290-2').save()

        //nuevo proyecto con codigo PRX01
        new Project(codeProject : "PRX01", paidByCompleteTask : false, 
            totalAmount : 100000, createdBy : "david@kustomer.cl", 
            name : "Proyecto Celeste", 
            description : "Proyecto uno para asignar tareas",
            creationDate : new Date(), 
            fromDate : new Date(), thruDate : new Date()).save()

        //tarea para proyecto PRX01
        new ProjectTask(project : 1, status : "In_Process", createdBy : "david@kustomer.cl", 
            name : "Proyecto Celeste", description : "Tarea Uno con detalle para primer proyecto",
            creationDate : new Date()).save()

        //participante uno, con datos de Camilo.
        new Party(address:"Seminario 372", 
                createdBy:"david@kustomer.cl",
                creationDate:new Date(), 
                firstName:"Camilo", 
                gender:"Masculino",
                isCompany:false, 
                lastName:"Jorquera", 
                mail:"camilo@kustomer.cl",
                nationality:"Chilena", 
                partyId:"18653290-2", 
                phone:"+56951135794",
                representative:"Camilo Jorquera").save()

        //detalle de proyecto (asignacion) 
        //con relacion entre participante 1 y proyecto 1
        new ProjectDetail(project : 1, createdBy : "david@kustomer.cl", 
            party : 1, description : "Tarea Uno con detalle para primer proyecto",
            creationDate : new Date()).save()

        //presupuesto asignado al detalle de proyecto (asignacion) 1.
        //hace referencia al proyecto uno con el participante 1.
        new ProjectBudget(projectDetail : 1, createdBy : "david@kustomer.cl", 
            name : "Proyecto Celeste", description : "Tarea Uno con detalle para primer proyecto",
            creationDate : new Date()).save()

        //roles de usuario
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
        UserRole.create cristian, rolAdmin
        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
}
