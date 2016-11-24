package cl.kustomer

/**
 * Clase ProjectDetail.
 * Referente a tabla detalles de proyectos, guardando relación
 * entre participantes y proyectos.
 */
class ProjectDetail {

    String description
    String createdBy
    Date creationDate = new Date()

    static hasMany = [document: Document, budget: Budget]
    static belongsTo = [party: Party, project: Project]

    static constraints = {
    }
}
