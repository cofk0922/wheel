package th.ac.chula.bsd.security

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}

enum RoleName {
	ROLE_ADMIN, ROLE_USER, ANONYNMOUS
}
