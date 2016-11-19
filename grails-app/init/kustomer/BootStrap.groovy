package kustomer
import cl.kustomer.User

class BootStrap {

    def init = { servletContext ->
        new User(rut:"18653290-2",nombre:"Camilo",esEmpresa:false,giro:"X",nacionalidad:"Chile",genero:"Masculino",direccion:"Acca",telefono:"13",
            representante:"Yo",correo:"camilo@kustomer.cl",fechaCreacion:new Date()).save(failOnError: true)
        new User(rut:"16652214-5",nombre:"David",esEmpresa:false,giro:"X",nacionalidad:"Chile",genero:"Masculino",direccion:"Acca",telefono:"13",
            representante:"Yo",correo:"david@kustomer.cl",fechaCreacion:new Date()).save(failOnError: true)
        new User(rut:"18875224-1",nombre:"Cristian",esEmpresa:false,giro:"X",nacionalidad:"Chile",genero:"Masculino",direccion:"Acca",telefono:"13",
            representante:"Yo",correo:"cristian@kustomer.cl",fechaCreacion:new Date()).save(failOnError: true)
    }
    def destroy = {
    }
}
