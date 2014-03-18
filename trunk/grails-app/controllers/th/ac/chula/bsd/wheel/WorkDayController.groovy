package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
@Transactional(readOnly = true)
class WorkDayController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		
		def workLists
		
		def userRole = u.getAuthorities()
		
		if(userRole.find{it -> it.authority == 'ROLE_SUPERADMIN'}){
			def branchID = params.branchID ?: b.id
			workLists = WorkDay.withCriteria {
				eq('branch.id', branchID)
				and {
					order('branch.id')
					order('workDayCode')
				}
			}
		}else {
			workLists = WorkDay.withCriteria {
				eq('branch.id', b.id)
				and {
					order('branch.id')
					order('workDayCode')
				}
			}
		}
		
        params.max = Math.min(max ?: 10, 100)
        respond workLists, model:[workDayInstanceCount: workLists.size()]
    }

    def show(WorkDay workDayInstance) {
        respond workDayInstance
    }

    def create() {
        respond new WorkDay(params)
    }

    @Transactional
    def save(WorkDay workDayInstance) {
        if (workDayInstance == null) {
            notFound()
            return
        }

        if (workDayInstance.hasErrors()) {
            respond workDayInstance.errors, view:'create'
            return
        }

        workDayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'workDayInstance.label', default: 'WorkDay'), workDayInstance.id])
                redirect workDayInstance
            }
            '*' { respond workDayInstance, [status: CREATED] }
        }
    }

    def edit(WorkDay workDayInstance) {
        respond workDayInstance
    }

    @Transactional
    def update(WorkDay workDayInstance) {
        if (workDayInstance == null) {
            notFound()
            return
        }

        if (workDayInstance.hasErrors()) {
            respond workDayInstance.errors, view:'edit'
            return
        }

        workDayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WorkDay.label', default: 'WorkDay'), workDayInstance.id])
                redirect workDayInstance
            }
            '*'{ respond workDayInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WorkDay workDayInstance) {

        if (workDayInstance == null) {
            notFound()
            return
        }

        workDayInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WorkDay.label', default: 'WorkDay'), workDayInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'workDayInstance.label', default: 'WorkDay'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
