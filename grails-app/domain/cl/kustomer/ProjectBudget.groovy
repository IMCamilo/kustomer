package cl.kustomer

class ProjectBudget {

    String name
    String description
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
