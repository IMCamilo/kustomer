package cl.kustomer

class Budget {

    String name
    String description
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
