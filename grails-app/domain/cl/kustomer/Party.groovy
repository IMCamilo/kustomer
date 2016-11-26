package cl.kustomer

/**
 * Clase Party.
 * Referente a tabla de participantes del sistema. Toda entidad
 * que participa en el sistema, clientes, administradores, empresas.
 */
class Party {

	String partyId //rut
	String firstName
	String lastName
	String nationality
	String gender
	String address
	String phone
	String mail
	String representative
	String createdBy
	Boolean isCompany
	Date creationDate = new Date()

	static hasMany = [projectDetail: ProjectDetail]

    static constraints = {
		gender inList : ['No Aplica','Masculino','Feminino']
    }
}
