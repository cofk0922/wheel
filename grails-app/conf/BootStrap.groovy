import th.ac.chula.bsd.wheel.CarBand
import th.ac.chula.bsd.wheel.CarModel
import th.ac.chula.bsd.wheel.Product
import th.ac.chula.bsd.wheel.ProductType;
import th.ac.chula.bsd.wheel.ProductStock
import th.ac.chula.bsd.security.Role;
import th.ac.chula.bsd.security.RoleName;
import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.security.UserRole;
import th.ac.chula.bsd.wheel.Branch;

class BootStrap {

    def init = { servletContext ->
		
		// Initial Branch and User
		if(Branch.count() <= 0) {

			def superAdminRole = new Role(authority:'ROLE_SUPERADMIN')
			superAdminRole.save(flush:true)
			def adminRole = new Role(authority:RoleName.ROLE_ADMIN)
			adminRole.save(flush:true)
			
			def initBranch = new Branch()
			initBranch.branchName = "Main Branch"
			initBranch.branchAddress = "-"
			initBranch.initialWorkDay()
			initBranch.save(flush:true)
			
			def user = new User(username:'superadmin', password:'superadmin', branch: initBranch, firstName:'Superadmin', lastName:'Superadmin', email:'superadmin@wheel.com')
			user.save(flush:true)
			
			def userRole = new UserRole(user:user, role:superAdminRole)
			userRole.save(flush:true)
			
			def adminUser = initBranch.genAdminUser()
			adminUser.save(flush:true)
			def useradminRole = new UserRole(user:adminUser, role:adminRole)
			useradminRole.save(flush:true)

			// Initial Installation Product
			def installation = new Product(prodName:'Installation', prodDesc:'Installation Price', productType:ProductType.INSTALLATION)
			installation.save(flush:true)
			def installStock = new ProductStock(stock:1, branch: initBranch, product: installation)
			installStock.save(flush:true)
			
			
//			def superAdminRole = Role.findOrSaveWhere(authority:'ROLE_SUPERADMIN')
//			def user = User.findOrSaveWhere(username:'superadmin', password:'superadmin', branch: initBranch, firstName:'Superadmin', lastName:'Superadmin', email:'superadmin@wheel.com')
//			UserRole.create(user, superAdminRole, true)
		}
		/*
		Branch b = Branch.get(1)
		Branch b2 = Branch.get(2)
		
		def adminRole = Role.findOrSaveWhere(authority:'ROLE_ADMIN')
		def userRole = Role.findOrSaveWhere(authority:'ROLE_USER')
		def user = User.findOrSaveWhere(username:'user1', password:'user1', branch: b, firstName:'Userfirstname', lastName:'Userlastname', email:'user1@wheel.bsd.chula.ac.th')
		
		def user2 = User.findOrSaveWhere(username:'user2', password:'user2', branch: b2, firstName:'Userfirstname', lastName:'Userlastname', email:'user2@wheel.bsd.chula.ac.th')
		
		
		if(!user.authorities.contains(adminRole)){
			UserRole.create(user, adminRole,true)
		}
		
		if(!user.authorities.contains(userRole)){
			UserRole.create(user, userRole,true)
		}
		
		
		if(!user2.authorities.contains(adminRole)){
			UserRole.create(user2, adminRole,true)
		}
		
		if(!user2.authorities.contains(userRole)){
			UserRole.create(user2, userRole,true)
		}
		*/
		
		
		 /*
//		new CarBand(bandName:'HONDA').save(flush:true)
		new CarModel(modelName:'Jazz Y2003 ',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
		new CarModel(modelName:'City Y2005 ',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
				
//		new CarBand(bandName:'TOYOTA').save(flush:true)		
		new CarModel(modelName:'Yaris Y2013 ',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
		new CarModel(modelName:'Altris Y2011 ',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
		
//		new CarBand(bandName:'MAZDA').save(flush:true)
		new CarModel(modelName:'Mazda 2 spirit',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
		new CarModel(modelName:'New Mazda 3 ',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
				
//		new CarBand(bandName:'SUZUKI').save(flush:true)
		new CarModel(modelName:'Swiff 1.5',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
		new CarModel(
			modelName:'Swiff Eco Car 1.2',
			year: '2012',
			band:CarBand.get(4),
			gearRatio:1.0,
			offSet:1.0,
			pcdCode:"xx",
			weight:2.0,
			defaultTireSize:13,
			netSize:0.3).save(flush:true)
	
		*/
    }
    def destroy = {
    }
	
	def messageSource
	def saveMessageResources={
		messageSource.clearCache()
	}
}
