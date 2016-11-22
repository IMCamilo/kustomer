package cl.kustomer

class Project {

    String codeProject
    String nombre
    //cliente
    Integer presupuesto
    Integer montoAPagar
    String descripcion
    Date fechaInicio
    Date fechaTermino

    static constraints = {
        codeProject blank: false, unique: true
    }
}
