package cl.kustomer

class Document {

    Integer numberDocument
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
