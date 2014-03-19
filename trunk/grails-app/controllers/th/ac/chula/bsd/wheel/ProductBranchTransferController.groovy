package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProductBranchTransferController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProductBranchTransfer.list(params), model:[productBranchTransferInstanceCount: ProductBranchTransfer.count()]
    }

    def show(ProductBranchTransfer productBranchTransferInstance) {
        respond productBranchTransferInstance
    }

    def create() {
        respond new ProductBranchTransfer(params)
    }

    @Transactional
    def save(ProductBranchTransfer productBranchTransferInstance) {
        if (productBranchTransferInstance == null) {
            notFound()
            return
        }

        if (productBranchTransferInstance.hasErrors()) {
            respond productBranchTransferInstance.errors, view:'create'
            return
        }

        productBranchTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productBranchTransferInstance.label', default: 'ProductBranchTransfer'), productBranchTransferInstance.id])
                redirect productBranchTransferInstance
            }
            '*' { respond productBranchTransferInstance, [status: CREATED] }
        }
    }

    def edit(ProductBranchTransfer productBranchTransferInstance) {
        respond productBranchTransferInstance
    }

    @Transactional
    def update(ProductBranchTransfer productBranchTransferInstance) {
        if (productBranchTransferInstance == null) {
            notFound()
            return
        }

        if (productBranchTransferInstance.hasErrors()) {
            respond productBranchTransferInstance.errors, view:'edit'
            return
        }

        productBranchTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductBranchTransfer.label', default: 'ProductBranchTransfer'), productBranchTransferInstance.id])
                redirect productBranchTransferInstance
            }
            '*'{ respond productBranchTransferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductBranchTransfer productBranchTransferInstance) {

        if (productBranchTransferInstance == null) {
            notFound()
            return
        }

        productBranchTransferInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductBranchTransfer.label', default: 'ProductBranchTransfer'), productBranchTransferInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productBranchTransferInstance.label', default: 'ProductBranchTransfer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
