package cl.kustomer

class ProjectTask {

    String name
    String description
    String status //in_process, finished, no_initiate
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [project: Project]

    static constraints = {
    }
}
