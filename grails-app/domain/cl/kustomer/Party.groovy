package cl.kustomer

class Party {

	String rut
	String firstName
	String lastName
	String nationality
	String gender
	String address
	String phone
	String representative
	String mail
	Boolean isCompany
	Date creationDate = new Date()

	static hasMany = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
