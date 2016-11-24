package cl.kustomer

class Project {

    String codeProject
    String name
    Integer totalAmount
    String desciption
    Date fromDate
    Date thruDate
    String createdBy
    Date creationDate = new Date()

    static hasMany = [projectDetail: ProjectDetail, projectTask: ProjectTask]

    static constraints = {
        codeProject blank: false, unique: true
    }
}
