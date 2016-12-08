package cl.kustomer

/**
 * Clase ProjectBudget.
 * Referente a tabla presupuestos de proyectos.
 */
class ProjectBudget {

    String name
    String description
    Integer totalAmount
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [project: Project]

    static constraints = {
    }
}
