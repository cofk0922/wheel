package th.ac.chula.bsd.security

import th.ac.chula.bsd.wheel.Branch;

class User {
	String username
	String password
	
	static hasOne = [branch: Branch]

	static mapping = {
		branch lazy: false
	}
	
	static constraints = {
		username blank: false
		password blank:false, password: true
	}

}
