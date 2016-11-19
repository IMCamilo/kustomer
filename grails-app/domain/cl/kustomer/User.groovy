package cl.kustomer

class User {

    String rut
    String nombre
    String giro
    String nacionalidad
    String genero
    String direccion
    String telefono
    String representante
    String correo
    Boolean esEmpresa
    String fechaCreacion = new Date()

    static constraints = {
        genero inList: ["Feminino","Masculino"]
    }
}
