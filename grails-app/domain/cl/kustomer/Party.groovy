package cl.kustomer

class Party {

	String partyId //rut
	String firstName
	String lastName
	String nationality
	String gender
	String address
	String phone
	String mail
	Boolean isCompany
	String representative
	String createdBy
	Date creationDate = new Date()

	static hasMany = [projectDetail: ProjectDetail]

    static constraints = {
    }
}
