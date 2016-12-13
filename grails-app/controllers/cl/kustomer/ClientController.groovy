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

            //===================================================
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
            //===================================================
            detailProjectMap.totalTask = totalTask
            detailProjectMap.percentyTaskFinished = percentyTaskFinished

            listProjectForUser.add(detailProjectMap)
        }
        [detailsUser:detailsUser, listProjectForUser:listProjectForUser]
    }

    @Secured(['ROLE_USER'])
    def budget() {

    }

}