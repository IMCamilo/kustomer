package cl.kustomerd

/**
 * Clase Budget.
 * Referente a tabla de presupuestos para proyectos.
 */
class Budget {

    String name
    String description
    String createdBy
    Date creationDate = new Date()

    static belongsTo = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
