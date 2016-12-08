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
        def currentDetailList = ProjectDetail.findById(projectBudget.projectDetailId)
        def currentProjectDetail = Project.findById(currentDetailList.projectId)
        def mapWithCurrentDetails = [
            id:currentDetailList.id,
            codeProject: currentProjectDetail.codeProject,
            name: currentProjectDetail.name
        ]
        respond projectBudget, model:[mapWithCurrentDetails:mapWithCurrentDetails]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def projectDetailList = ProjectDetail.list()
        def detailList = []
        projectDetailList.each {
            def projectDetailListMap = [:]
            projectDetailListMap.id = it.id
            def projectDetail = Project.findById(it.projectId)
            projectDetailListMap.codeProject = projectDetail.codeProject
            projectDetailListMap.name = projectDetail.name
            detailList.add(projectDetailListMap)
        }
        def principal = springSecurityService.principal
        String username = principal.username
        respond new ProjectBudget(params), 
            model:[username:username, detailList:detailList]
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
        def currentDetailList = ProjectDetail.findById(projectBudget.projectDetailId)
        def currentProjectDetail = Project.findById(currentDetailList.projectId)
        def mapWithCurrentDetails = [
            id:currentDetailList.id,
            codeProject: currentProjectDetail.codeProject,
            name: currentProjectDetail.name
        ]
        def projectDetailList = ProjectDetail.list()
        def detailList = []
        projectDetailList.each {
            def projectDetailListMap = [:]
            projectDetailListMap.id = it.id
            def projectDetail = Project.findById(it.projectId)
            projectDetailListMap.codeProject = projectDetail.codeProject
            projectDetailListMap.name = projectDetail.name
            detailList.add(projectDetailListMap)
        }
        respond projectBudget, model:[detailList:detailList, mapWithCurrentDetails:mapWithCurrentDetails]
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
