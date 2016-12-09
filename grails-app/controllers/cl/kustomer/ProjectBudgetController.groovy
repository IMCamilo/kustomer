package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectBudgetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProjectBudget.list(params), model:[projectBudgetCount: ProjectBudget.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(ProjectBudget projectBudget) {
        def currentProject = Project.findById(projectBudget.projectId)
        respond projectBudget, model:[currentProject:currentProject]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def projectList = Project.list()
        def principal = springSecurityService.principal
        String username = principal.username
        respond new ProjectBudget(params), 
            model:[username:username, projectList:projectList]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save() {

        def p = null

        try {
            String[] projectInForm = ((String) params.projectId).split(" - ");
            p = Project.findById(projectInForm[1])
        } catch (Exception e) {
            println "Error vaclidando presupuesto ${e.getMessage()}"
        }

        if (!p) {
            flash.message = "Debes seleccionar al menos un proyecto para este presupuesto"
            redirect(controller: "projectBudget", action: "create")
            return
        }
        params.project = p.id

        def projectBudget = new ProjectBudget(params)

        if (projectBudget == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectBudget.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectBudget.errors, view:'create'
            return
        }

        projectBudget.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), projectBudget.id])
                redirect projectBudget
            }
            '*' { respond projectBudget, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(ProjectBudget projectBudget) {
        def currentProject = Project.findById(projectBudget.projectId)
        def projectList = Project.list()
        def detailList = []
        respond projectBudget, model:[projectList:projectList,
            currentProject:currentProject]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update() {
        def p = null

        try {
            String[] projectInForm = ((String) params.projectId).split(" - ");
            p = Project.findById(projectInForm[1])
        } catch (Exception e) {
            println "Error vaclidando presupuesto ${e.getMessage()}"
        }

        if (!p) {
            flash.message = "Debes seleccionar al menos un proyecto para este presupuesto"
            redirect(controller: "projectBudget", action: "create")
            return
        }
        params.project = p.id

        def projectBudget = new ProjectBudget(params)

        if (projectBudget == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectBudget.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectBudget.errors, view:'edit'
            return
        }

        projectBudget.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), projectBudget.id])
                redirect projectBudget
            }
            '*'{ respond projectBudget, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(ProjectBudget projectBudget) {

        if (projectBudget == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        projectBudget.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), projectBudget.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectBudget.label', default: 'ProjectBudget'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
