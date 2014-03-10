import th.ac.chula.bsd.wheel.CarBand
import th.ac.chula.bsd.wheel.CarModel

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
		
		
		 
		//new CarBand(bandName:'HONDA').save(flush:true)
//		new CarModel(model:'Jazz Y2003 ',band: CarBand.get(1),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
//		new CarModel(model:'City Y2005 ',band: CarBand.get(1),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
		
		
		//new CarBand(bandName:'TOYOTA').save(flush:true)
		
//		new CarModel(model:'Yaris Y2013 ',band:CarBand.get(2),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
//		new CarModel(model:'Altris Y2011 ',band:CarBand.get(2),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
		
		//new CarBand(bandName:'MAZDA').save(flush:true)
//		new CarModel(model:'Mazda 2 spirit',band:CarBand.get(3),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
//		new CarModel(model:'New Mazda 3 ',band:CarBand.get(3),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
		
		
		//new CarBand(bandName:'SUZUKI').save(flush:true)
//		new CarModel(model:'Swiff 1.5',band:CarBand.get(4),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
//		new CarModel(model:'Swiff Eco Car 1.2',band:CarBand.get(4),gearRatio:1.0,offSet:1.0,pcdCode:"xx",weight:2.0).save(flush:true)
	
		
    }
    def destroy = {
    }
}
