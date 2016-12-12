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
        def qtyTask = 0
        def qtyTaskFinished = 0
        if(project.paidByCompleteTask == true) {
            def listTask = Project.findAll("from ProjectTask where project=" + project.id)
            println "list task"
            qtyTask = listTask.size()
            println "cantidad tareas => ${listTask.size()}"
            listTask.each {
                println "===> estado tareas =====> $it.status"
                if("Finished".equals(it.status)) qtyTaskFinished += 1 
            }
            println "cantidad tareas = ${listTask.size()}, cantidad tareas completas : ${qtyTaskFinished}"
        }
        qtyTask=qtyTask*10
        def percentyTaskFinished
        
        if  (qtyTaskFinished < 1 || qtyTask < 1) {
            percentyTaskFinished = 0
        } else {
            percentyTaskFinished = ( qtyTaskFinished/qtyTask ) * 100
        }
        println "qty tareas => $qtyTask"
        println "qty tareas finalizadas => $qtyTaskFinished"

    


        respond project, model:[username:username, qtyTask:qtyTask, percentyTaskFinished:percentyTaskFinished]
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
