package kustomer
import cl.kustomer.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        //roles y usuarios
        def rolUserStandar = new Role('ROLE_USER').save()
        def roleAdmin = new Role('ROLE_ADMIN').save()   
        def camilo = new User('camilo@kustomer.cl','qwerty','18653290-2').save()
        def david = new User('david@kustomer.cl','qwerty','18611290-2').save()
        def cristian = new User('cristian@kustomer.cl','qwerty','13644290-2').save()

        //nuevo proyecto con codigo PRX01
        new Project(codeProject : "PRX01", paidByCompleteTask : false, 
            totalAmount : 100000, createdBy : "david@kustomer.cl", 
            name : "Proyecto Celeste", 
            description : "Proyecto cargado automaticamente cod PRX01",
            creationDate : new Date(), 
            fromDate : new Date(), thruDate : new Date()).save()

        //nuevo proyecto con codigo PRX02
        new Project(codeProject : "PRX02", paidByCompleteTask : true, 
            totalAmount : 100000, createdBy : "david@kustomer.cl", 
            name : "Proyecto Celeste", 
            description : "Proyecto cargado automaticamente cod PRX02",
            creationDate : new Date(), 
            fromDate : new Date(), thruDate : new Date()).save()

        //tarea para proyecto PRX01
        new ProjectTask(project : 1, status : "In_Process", createdBy : "david@kustomer.cl", 
            name : "Tarea para PRX01", description : "Tarea Uno con detalle para proyecto PRX01",
            creationDate : new Date()).save()
        
        //tarea para proyecto PRX02
        new ProjectTask(project : 2, status : "In_Process", createdBy : "david@kustomer.cl", 
            name : "Tarea para PRX02", description : "Tarea Uno con detalle para proyecto PRX02",
            creationDate : new Date()).save()
        
        //tarea para proyecto PRX02
        new ProjectTask(project : 2, status : "In_Process", createdBy : "david@kustomer.cl", 
            name : "Tarea para PRX02", description : "Tarea Dos con detalle para proyecto PRX02",
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

        //participante dos, con datos de Camilo.
        new Party(address:"Serena 372", 
                createdBy:"cristian@kustomer.cl",
                creationDate:new Date(), 
                firstName:"Cristian", 
                gender:"Masculino",
                isCompany:false, 
                lastName:"X-X", 
                mail:"cristian@kustomer.cl",
                nationality:"Chilena", 
                partyId:"13644290-2", 
                phone:"+56997647747",
                representative:"Cristian").save()
            

        //detalle de proyecto (asignacion) 
        //con relacion entre participante 1 y proyecto 1
        new ProjectDetail(project : 1, createdBy : "david@kustomer.cl", 
            party : 1, description : "Tarea Uno con detalle para primer proyecto",
            creationDate : new Date()).save()

        //presupuesto de 10.000.000 asignado al detalle de proyecto (asignacion) 1.
        //hace referencia al proyecto uno con el participante 1.
        new ProjectBudget(project : 1, createdBy : "david@kustomer.cl", totalAmount: 10000000,
            name : "Proyecto Celeste", description : "Tarea Uno con detalle para primer proyecto",
            creationDate : new Date()).save()

        //roles de usuario
        UserRole.create camilo, roleAdmin
        UserRole.withSession {
            it.flush()
            it.clear()
        }
        UserRole.create david, roleAdmin
        UserRole.withSession {
            it.flush()
            it.clear()
        }
        UserRole.create cristian, roleAdmin
        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
}
