package cl.kustomer

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

import pl.touk.excel.export.WebXlsxExporter
import pl.touk.excel.export.XlsxExporter
import pl.touk.excel.export.getters.LongToDatePropertyGetter

@Transactional(readOnly = true)
class DocumentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Document.list(params), model:[documentCount: Document.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(Document document) {
        def currentProject = Project.findById(document.projectId)
        //budgets
        def listBudgetForProject = ProjectBudget.findAll("from ProjectBudget where project=" + document.projectId)
        //tasks
        def listTaskForProject = ProjectTask.findAll("from ProjectTask where project=" + document.projectId)
        //parties
        def partiesInProject = ProjectDetail.findAll("from ProjectDetail where project=" + document.projectId)
        def listPartiesForProject = []
        partiesInProject.each {
            def detailParty = Party.findById(it.partyId)
            def currentParty = [:]
            currentParty.partyId = detailParty.partyId
            currentParty.firstName = detailParty.firstName
            currentParty.lastName = detailParty.lastName
            currentParty.mail = detailParty.mail
            currentParty.address = detailParty.address
            listPartiesForProject.add(currentParty)
        }

        respond document, model:[currentProject:currentProject, listTaskForProject:listTaskForProject,
            listPartiesForProject:listPartiesForProject, listBudgetForProject:listBudgetForProject]
    }
        
    @Secured(['ROLE_ADMIN'])
    def create() {
        def principal = springSecurityService.principal
        String username = principal.username
        respond new Document(params), model:[username:username]
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save() {

        def document = new Document(params)
        document.save flush: true, failOnError: true
        redirect controller: "projectDetail", action: "show", id: document.projectId

        if (document == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (document.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond document.errors, view:'create'
            return
        }

    }

    @Secured(['ROLE_ADMIN'])
    def edit(Document document) {
        respond document
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def update(Document document) {
        if (document == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (document.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond document.errors, view:'edit'
            return
        }

        document.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'document.label', default: 'Document'), document.id])
                redirect document
            }
            '*'{ respond document, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Document document) {

        if (document == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        document.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'document.label', default: 'Document'), document.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def downloadDocument() {
        //current project details
        def currentProject = Project.findById(params.projectId)
        //budgets
        def listBudgetForProject = ProjectBudget.findAll("from ProjectBudget where project=" + params.projectId)
        //tasks
        def listTaskForProject = ProjectTask.findAll("from ProjectTask where project=" + params.projectId)
        //parties
        def partiesInProject = ProjectDetail.findAll("from ProjectDetail where project=" + params.projectId)
        def listPartiesForProject = []
        partiesInProject.each {
            def detailParty = Party.findById(it.partyId)
            def currentParty = [:]
            currentParty.partyId = detailParty.partyId
            currentParty.firstName = detailParty.firstName
            currentParty.lastName = detailParty.lastName
            currentParty.mail = detailParty.mail
            currentParty.address = detailParty.address
            listPartiesForProject.add(currentParty)
        }
        String path = "${System.getProperty("user.dir")}${File.separator}grails-app${File.separator}base${File.separator}templates${File.separator}documentBase.xlsx"
        new WebXlsxExporter(path).with {
            setResponseHeaders(response)
            //putCellValue(//fila,//columna,//texto)
            putCellValue(3, 2, currentProject.codeProject)
            putCellValue(4, 2, currentProject.name)
            putCellValue(5, 2, currentProject.totalAmount)
            putCellValue(6, 2, currentProject.description)
            putCellValue(7, 2, currentProject.paidByCompleteTask)
            putCellValue(8, 2, currentProject.creationDate)
            putCellValue(9, 2, currentProject.fromDate)
            putCellValue(10, 2, currentProject.thruDate)

            //BUDGETS IN EXCEL
            putCellValue(12, 0, "PRESUPUESTOS")
            Integer linesForControl = 14
            listBudgetForProject.eachWithIndex{ budget, idx -> 
                putCellValue(linesForControl+idx, 0, budget.name)
                putCellValue(linesForControl+idx, 1, budget.description)
                putCellValue(linesForControl+idx, 2, budget.totalAmount)
                putCellValue(linesForControl+idx, 3, budget.creationDate)
                putCellValue(linesForControl+idx, 4, budget.createdBy)
            }

            //TASK IN EXCEL
            linesForControl += 3
            putCellValue(linesForControl, 0, "TAREAS")
            linesForControl += 1
            putCellValue(linesForControl, 0, "NOMBRE")
            putCellValue(linesForControl, 1, "DESCRIPCION")
            putCellValue(linesForControl, 2, "ESTADO")
            putCellValue(linesForControl, 3, "FECHA CREACION")
            putCellValue(linesForControl, 4, "CREADO POR")
            linesForControl += 1
            listTaskForProject.eachWithIndex { task, idx ->
                putCellValue(linesForControl+idx, 0, task.name)
                putCellValue(linesForControl+idx, 1, task.description)
                if("In_Process".equals(task.status)) putCellValue(linesForControl+idx, 2, "En proceso")
                else  putCellValue(linesForControl+idx, 2, "Terminada")
                putCellValue(linesForControl+idx, 3, task.creationDate)
                putCellValue(linesForControl+idx, 4, task.createdBy)
            }

            
            //PARTY IN EXCEL
            linesForControl += 3
            putCellValue(linesForControl, 0, "PARTICIPANTES")
            linesForControl += 1
            putCellValue(linesForControl, 0, "RUT")
            putCellValue(linesForControl, 1, "NOMBRES")
            putCellValue(linesForControl, 2, "APELLIDOS")
            putCellValue(linesForControl, 3, "CORREO")
            putCellValue(linesForControl, 4, "DIRECCION")
            linesForControl += 1
            listPartiesForProject.eachWithIndex { party, idx ->
                putCellValue(linesForControl+idx, 0, party.partyId)
                putCellValue(linesForControl+idx, 1, party.firstName)
                putCellValue(linesForControl+idx, 2, party.lastName)
                putCellValue(linesForControl+idx, 3, party.mail)
                putCellValue(linesForControl+idx, 4, party.address)
            }

            save(response.outputStream)
        }

    }

}
