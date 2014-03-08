import th.ac.chula.bsd.security.Role;
import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.security.UserRole;
import th.ac.chula.bsd.wheel.Branch;

class BootStrap {

    def init = { servletContext ->
		/*
		Branch b = Branch.get(1)
		
		def adminRole = Role.findOrSaveWhere(authority:'ROLE_ADMIN')
		def userRole = Role.findOrSaveWhere(authority:'ROLE_USER')
		def user = User.findOrSaveWhere(username:'user1', password:'user1', branch: b, firstName:'Userfirstname', lastName:'Userlastname', email:'user1@wheel.bsd.chula.ac.th')
		
		if(!user.authorities.contains(adminRole)){
			UserRole.create(user, adminRole,true)
		}
		
		if(!user.authorities.contains(userRole)){
			UserRole.create(user, userRole,true)
		}
		*/
    }
    def destroy = {
    }
}
