package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
    
    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectCount: Project.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Project project) {
        def principal = springSecurityService.principal
        String username = principal.username
       
        def totalTask = 1
        def qtyTaskFinished = 0
        
        if(project.paidByCompleteTask == true) {
            def listTask = Project.findAll("from ProjectTask where project=" + project.id)
            totalTask = listTask.size()
            listTask.each {
                if ("Finished".equals(it.status)) qtyTaskFinished += 1 
            }
        }
        Double percentyTaskFinished
        try {
            percentyTaskFinished = ( qtyTaskFinished/totalTask ) * 100
        } catch(ArithmeticException ae) {
            percentyTaskFinished = 0
            println "error con =========> $ae"
        }
        respond project, model:[username:username, totalTask:totalTask, percentyTaskFinished:percentyTaskFinished.round()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def principal = springSecurityService.principal
        String username = principal.username
        respond new Project(params), model:[username:username]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(Project project) {
        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond project.errors, view:'create'
            return
        }

        project.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*' { respond project, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Project project) {
        respond project
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Project project) {
        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond project.errors, view:'edit'
            return
        }

        project.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*'{ respond project, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Project project) {

        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        project.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
