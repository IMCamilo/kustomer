package cl.kustomer

class ProjectDetail {

    static hasMany = [document: Document, budget: Budget]
    static belongsTo = [party: Party, project: Project]

    static constraints = {
    }
}
