package cl.kustomer

/**
 * Clase Document.
 * Referente a tabla de documentos generados, por total o
 * por hitos del proyecto.
 */
class Document {

    String createdBy
    String projectId
    Date creationDate = new Date()

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
