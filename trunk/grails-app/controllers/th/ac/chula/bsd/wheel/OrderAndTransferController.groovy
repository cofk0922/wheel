package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrderAndTransferController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrderAndTransfer.list(params), model:[orderAndTransferInstanceCount: OrderAndTransfer.count()]
    }

    def show(OrderAndTransfer orderAndTransferInstance) {
        respond orderAndTransferInstance
    }

    def create() {
        respond new OrderAndTransfer(params)
    }

    @Transactional
    def save(OrderAndTransfer orderAndTransferInstance) {
        if (orderAndTransferInstance == null) {
            notFound()
            return
        }

        if (orderAndTransferInstance.hasErrors()) {
            respond orderAndTransferInstance.errors, view:'create'
            return
        }

        orderAndTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orderAndTransferInstance.label', default: 'OrderAndTransfer'), orderAndTransferInstance.id])
                redirect orderAndTransferInstance
            }
            '*' { respond orderAndTransferInstance, [status: CREATED] }
        }
    }

    def edit(OrderAndTransfer orderAndTransferInstance) {
        respond orderAndTransferInstance
    }

    @Transactional
    def update(OrderAndTransfer orderAndTransferInstance) {
        if (orderAndTransferInstance == null) {
            notFound()
            return
        }

        if (orderAndTransferInstance.hasErrors()) {
            respond orderAndTransferInstance.errors, view:'edit'
            return
        }

        orderAndTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrderAndTransfer.label', default: 'OrderAndTransfer'), orderAndTransferInstance.id])
                redirect orderAndTransferInstance
            }
            '*'{ respond orderAndTransferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrderAndTransfer orderAndTransferInstance) {

        if (orderAndTransferInstance == null) {
            notFound()
            return
        }

        orderAndTransferInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrderAndTransfer.label', default: 'OrderAndTransfer'), orderAndTransferInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderAndTransferInstance.label', default: 'OrderAndTransfer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
