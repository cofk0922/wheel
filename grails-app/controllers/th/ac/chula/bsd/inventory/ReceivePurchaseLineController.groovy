package th.ac.chula.bsd.inventory



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER', 'ROLE_TECH'])
@Transactional(readOnly = true)
class ReceivePurchaseLineController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReceivePurchaseLine.list(params), model:[receivePurchaseLineInstanceCount: ReceivePurchaseLine.count()]
    }

    def show(ReceivePurchaseLine receivePurchaseLineInstance) {
        respond receivePurchaseLineInstance
    }

    def create() {
        respond new ReceivePurchaseLine(params)
    }

    @Transactional
    def save(ReceivePurchaseLine receivePurchaseLineInstance) {
        if (receivePurchaseLineInstance == null) {
            notFound()
            return
        }

        if (receivePurchaseLineInstance.hasErrors()) {
            respond receivePurchaseLineInstance.errors, view:'create'
            return
        }

        receivePurchaseLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'receivePurchaseLineInstance.label', default: 'ReceivePurchaseLine'), receivePurchaseLineInstance.id])
                redirect receivePurchaseLineInstance
            }
            '*' { respond receivePurchaseLineInstance, [status: CREATED] }
        }
    }

    def edit(ReceivePurchaseLine receivePurchaseLineInstance) {
        respond receivePurchaseLineInstance
    }

    @Transactional
    def update(ReceivePurchaseLine receivePurchaseLineInstance) {
        if (receivePurchaseLineInstance == null) {
            notFound()
            return
        }

        if (receivePurchaseLineInstance.hasErrors()) {
            respond receivePurchaseLineInstance.errors, view:'edit'
            return
        }

        receivePurchaseLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ReceivePurchaseLine.label', default: 'ReceivePurchaseLine'), receivePurchaseLineInstance.id])
                redirect receivePurchaseLineInstance
            }
            '*'{ respond receivePurchaseLineInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ReceivePurchaseLine receivePurchaseLineInstance) {

        if (receivePurchaseLineInstance == null) {
            notFound()
            return
        }

        receivePurchaseLineInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ReceivePurchaseLine.label', default: 'ReceivePurchaseLine'), receivePurchaseLineInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'receivePurchaseLineInstance.label', default: 'ReceivePurchaseLine'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
