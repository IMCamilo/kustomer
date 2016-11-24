package cl.kustomer

class ProjectDetail {

    String description
    String createdBy
    Date creationDate = new Date()

    static hasMany = [document: Document, budget: Budget]
    static belongsTo = [party: Party, project: Project]

    static constraints = {
    }
}
