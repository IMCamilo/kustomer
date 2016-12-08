package cl.kustomer

/**
 * Clase Project.
 * Referente a tabla de proyectos.
 */
class Project {

    String codeProject
    String name
    String description
    String createdBy
    Boolean paidByCompleteTask
    Integer totalAmount
    Date fromDate
    Date thruDate
    Date creationDate = new Date()

    static hasMany = [projectBudget: ProjectBudget,
        projectDetail: ProjectDetail, projectTask: ProjectTask]

    static constraints = {
        codeProject blank: false, unique: true
    }
}
