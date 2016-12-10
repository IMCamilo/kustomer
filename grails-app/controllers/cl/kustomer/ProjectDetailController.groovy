package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
class ProjectDetailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProjectDetail.list(params), model:[projectDetailCount: ProjectDetail.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(ProjectDetail projectDetail) {
        //project
        def currentProject = Project.findById(projectDetail.projectId)
        //tasks
        def listTaskForProject = ProjectTask.findAll("from ProjectTask where project=" + projectDetail.projectId)
        //parties
        def listPartiesForProject = ProjectDetail.findAll("from ProjectDetail where project=" + projectDetail.projectId)
        //document information
        def documentInformations = Document.find("from Document where projectDetail="+projectDetail.id+" order by id desc")
        //difference for enable create document
        def diffCreateDocument = new Date() - documentInformations.creationDate

        def principal = springSecurityService.principal
        String username = principal.username
        def partyFromAssign = Party.findById(projectDetail.partyId)
        def projectFromAssign = Project.findById(projectDetail.projectId)
        
        respond projectDetail, 
            model:[partyFromAssign:partyFromAssign, projectFromAssign:projectFromAssign,
                username:username, diffCreateDocument:diffCreateDocument]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def userList = Party.list()
        def projectList = Project.list()
        def principal = springSecurityService.principal
        String username = principal.username
        respond new ProjectDetail(params), model:[username: username, userList:userList, projectList:projectList]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save() {

        def u = null
        def p = null

        try {
            String[] partyInForm = ((String) params.partyId).split(" - ");
            String[] projectInForm = ((String) params.projectId).split(" - ");
            u = Party.findById(partyInForm[1])
            p = Project.findById(projectInForm[1])
        } catch (Exception e) {
            println "Error validando asignación ${e.getMessage()}"
        }

        if (!u || !p) {
            flash.message = "Debes seleccionar al menos un usuario o un proyecto para esta asignación"
            redirect(controller: "projectDetail", action: "create")
            return
        }
        params.party = u.id
        params.project = p.id

        def projectDetail = new ProjectDetail(params)

        if (projectDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectDetail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectDetail.errors, view:'create'
            return
        }

        projectDetail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), projectDetail.id])
                redirect projectDetail
            }
            '*' { respond projectDetail, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(ProjectDetail projectDetail) {
        def partyFromAssign = Party.findById(projectDetail.partyId)
        def projectFromAssign = Project.findById(projectDetail.projectId)
        def userList = Party.list()
        def projectList = Project.list()
        respond projectDetail, model:
            [userList:userList, projectList:projectList, projectFromAssign:projectFromAssign, partyFromAssign:partyFromAssign]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(ProjectDetail projectDetail) {
        if (projectDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (projectDetail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond projectDetail.errors, view:'edit'
            return
        }

        projectDetail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), projectDetail.id])
                redirect projectDetail
            }
            '*'{ respond projectDetail, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(ProjectDetail projectDetail) {

        if (projectDetail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        projectDetail.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), projectDetail.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDetail.label', default: 'ProjectDetail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
