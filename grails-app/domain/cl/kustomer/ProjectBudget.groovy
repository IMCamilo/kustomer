package cl.kustomer

/**
 * Clase ProjectBudget.
 * Referente a tabla presupuestos de proyectos.
 */
class ProjectBudget {

    String name
    String description
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
