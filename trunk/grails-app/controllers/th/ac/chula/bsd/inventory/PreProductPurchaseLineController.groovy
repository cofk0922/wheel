package th.ac.chula.bsd.inventory



import static org.springframework.http.HttpStatus.*
import th.ac.chula.bsd.wheel.Branch;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class PreProductPurchaseLineController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		def prePurchase = PreProductPurchaseLine.withCriteria{
			eq('branch.id', b.id)
			'in'("status",[PreProductPurchaseStatus.NEW])
			and{
				order('appointment.id', 'asc')
				order('updatedDate', 'asc')
			}
		}
		println 'prePurchase size: '+ prePurchase.size()
        params.max = Math.min(max ?: 10, 100)
        respond PreProductPurchaseLine.list(params), model:[preProductPurchaseLineInstanceCount: PreProductPurchaseLine.count()]
    }

    def show(PreProductPurchaseLine preProductPurchaseLineInstance) {
        respond preProductPurchaseLineInstance
    }

    def create() {
        respond new PreProductPurchaseLine(params)
    }

    @Transactional
    def save(PreProductPurchaseLine preProductPurchaseLineInstance) {
        if (preProductPurchaseLineInstance == null) {
            notFound()
            return
        }

        if (preProductPurchaseLineInstance.hasErrors()) {
            respond preProductPurchaseLineInstance.errors, view:'create'
            return
        }

        preProductPurchaseLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'preProductPurchaseLineInstance.label', default: 'PreProductPurchaseLine'), preProductPurchaseLineInstance.id])
                redirect preProductPurchaseLineInstance
            }
            '*' { respond preProductPurchaseLineInstance, [status: CREATED] }
        }
    }

    def edit(PreProductPurchaseLine preProductPurchaseLineInstance) {
        respond preProductPurchaseLineInstance
    }

    @Transactional
    def update(PreProductPurchaseLine preProductPurchaseLineInstance) {
        if (preProductPurchaseLineInstance == null) {
            notFound()
            return
        }

        if (preProductPurchaseLineInstance.hasErrors()) {
            respond preProductPurchaseLineInstance.errors, view:'edit'
            return
        }

        preProductPurchaseLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PreProductPurchaseLine.label', default: 'PreProductPurchaseLine'), preProductPurchaseLineInstance.id])
                redirect preProductPurchaseLineInstance
            }
            '*'{ respond preProductPurchaseLineInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PreProductPurchaseLine preProductPurchaseLineInstance) {

        if (preProductPurchaseLineInstance == null) {
            notFound()
            return
        }

        preProductPurchaseLineInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PreProductPurchaseLine.label', default: 'PreProductPurchaseLine'), preProductPurchaseLineInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'preProductPurchaseLineInstance.label', default: 'PreProductPurchaseLine'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
