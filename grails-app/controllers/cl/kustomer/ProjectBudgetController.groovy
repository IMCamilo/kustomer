package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectBudgetController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index() {
        def principal = springSecurityService.principal
        String username = principal.username
        def projectBudgetList = ProjectBudget.findAll("from ProjectBudget where project=" + params.projectId)
        model:[projectBudgetList:projectBudgetList, username:username]
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
    def save(ProjectBudget projectBudget) {

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
        redirect(action: "index", id: projectBudget.id, params:[projectId:params.project,codeProject:params.codePro])
    }

    @Secured(['ROLE_ADMIN'])
    def edit(ProjectBudget projectBudget) {
        respond projectBudget
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(ProjectBudget projectBudget) {
      
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
        redirect(action: "index", id: projectBudget.id, params:[projectId:params.projectId,codeProject:params.codePro])
   
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
