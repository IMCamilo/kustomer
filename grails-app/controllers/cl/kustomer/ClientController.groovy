package cl.kustomer
import grails.plugin.springsecurity.annotation.Secured

class ClientController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index() {
        def auth = springSecurityService.authentication
        def authorities = auth.authorities
        String role = authorities[0]
        if (role == 'ROLE_ADMIN') redirect(controller: "home", action: "index")

    }

    @Secured(['ROLE_USER'])
    def project() {
        def principal = springSecurityService.principal
        String username = principal.username
        def detailsUser = Party.findByMail(username)
        def listAssigments = ProjectDetail.findAll("from ProjectDetail where party=" + detailsUser.id)
        def listProjectForUser = []

        listAssigments.each {
            def detailProjectMap = [:]
            def currentProject = Project.find("from Project where id="+it.projectId)
            detailProjectMap.id = currentProject.id	
            detailProjectMap.codeProject = currentProject.codeProject
            detailProjectMap.name = currentProject.name
            detailProjectMap.paidByCompleteTask = currentProject.paidByCompleteTask
            detailProjectMap.totalAmount = currentProject.totalAmount
            detailProjectMap.creationDate = currentProject.creationDate
            def totalTask = 1
            def qtyTaskFinished = 0
            if (currentProject.paidByCompleteTask == true) {
            def listTask = Project.findAll("from ProjectTask where project=" + currentProject.id)
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
            detailProjectMap.totalTask = totalTask
            detailProjectMap.percentyTaskFinished = percentyTaskFinished.round()

            listProjectForUser.add(detailProjectMap)
        }
        [detailsUser:detailsUser, listProjectForUser:listProjectForUser]
    }

    @Secured(['ROLE_USER'])
    def budget() {
        
        def principal = springSecurityService.principal
        String username = principal.username
        def detailsUser = Party.findByMail(username)

    }

    @Secured(['ROLE_USER'])
    def detail() {
        def principal = springSecurityService.principal
        String username = principal.username
        def detailsUser = Party.findByMail(username)
        def currentProject = Project.findById(params.projectId)
        //budgets
        def listBudgetForProject = ProjectBudget.findAll("from ProjectBudget where project=" + params.projectId)
        //tasks
        def listTaskForProject = ProjectTask.findAll("from ProjectTask where project=" + params.projectId)
        //parties
        def partiesInProject = ProjectDetail.findAll("from ProjectDetail where project=" + params.projectId)
        //
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

        [detailsUser:detailsUser, currentProject:currentProject, listTaskForProject:listTaskForProject,
            listPartiesForProject:listPartiesForProject, listBudgetForProject:listBudgetForProject]

    }

    @Secured(['ROLE_USER'])
    def account() {
        def principal = springSecurityService.principal
        String username = principal.username
        def detailsUser = Party.findByMail(username)
        [detailsUser:detailsUser]
    }

}