package cl.kustomer

class Document {

    Integer numberDocument

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
