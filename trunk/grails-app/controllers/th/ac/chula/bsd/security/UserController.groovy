package th.ac.chula.bsd.security



import static org.springframework.http.HttpStatus.*
import th.ac.chula.bsd.wheel.Branch;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class UserController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		/*
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
		*/
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		def userRole = u.getAuthorities()
		
		if(userRole.find{it -> it.authority == 'ROLE_SUPERADMIN'}||userRole.find{it -> it.authority == 'ROLE_ADMIN'}){
			
			params.max = Math.min(max ?: 10, 100)
			params.offset = params.int('offset') ?: 0
	
			def userLists = User.withCriteria {
				eq('branch.id', b.id)
				and {
					order('username', 'asc')
				}
				//maxResults(new Integer( params.max))
				//firstResult(new Integer(params.offset))
			}
			println('user size = ' + userLists.size())
			//respond userLists.subList(params.int('offset') ? params.int('offset') - 1: 0, params.max), model:[appointmentInstanceCount: userLists.size()]
			respond User.list(params), model:[userInstanceCount: User.count()]
	
		}else {
			redirect(action:'show', id:u.id)
		}
    }

    def show(User userInstance) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		def userRole = u.getAuthorities()
		
		if(userRole.find{it -> it.authority == 'ROLE_SUPERADMIN'}||userRole.find{it -> it.authority == 'ROLE_ADMIN'}){}else{
			userInstance = u
		}
        respond userInstance
    }

    def create() {
		def bList = []
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		def userRole = u.getAuthorities()
		
		if(userRole.find{it -> it.authority == 'ROLE_SUPERADMIN'}){
			bList = Branch.getAll()
		}
		else{
			bList.add(b)
		}
		params.branchList = bList
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
		def u = springSecurityService.currentUser
		
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true
		def normalRole = Role.findByAuthority("ROLE_USER")
		new UserRole(role:normalRole, user:userInstance).save(flush:true)

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
		def bList = []
		def u = springSecurityService.currentUser
		Branch b = u.branch

		b.refresh()
		
		def userRole = u.getAuthorities()
		
		if(userRole.find{it -> it.authority == 'ROLE_SUPERADMIN'}||userRole.find{it -> it.authority == 'ROLE_ADMIN'}){
			bList = Branch.getAll()
		}
		else{
			bList.add(b)
			userInstance = u
		}
		params.branchList = bList
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
