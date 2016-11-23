package cl.kustomer

class Project {

    String codeProject
    String nombre
    Integer presupuesto
    Integer montoAPagar
    String descripcion
    Date fechaInicio
    Date fechaTermino

    static hasMany = [projectDetail: ProjectDetail, projectTask: ProjectTask]

    static constraints = {
        codeProject blank: false, unique: true
    }
}
