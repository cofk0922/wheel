package th.ac.chula.bsd.security

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString() {
		return this.authority
	}
}

enum RoleName {
	ROLE_ADMIN, ROLE_USER, ANONYNMOUS, ROLE_SALE, ROLE_TECH
}
