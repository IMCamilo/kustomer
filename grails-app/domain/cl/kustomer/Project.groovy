package cl.kustomer

/**
 * Clase Project.
 * Referente a tabla de proyectos.
 */
class Project {

    String codeProject
    String name
    String desciption
    String createdBy
    Integer totalAmount
    Date fromDate
    Date thruDate
    Date creationDate = new Date()

    static hasMany = [projectDetail: ProjectDetail, projectTask: ProjectTask]

    static constraints = {
        codeProject blank: false, unique: true
    }
}
