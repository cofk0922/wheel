package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProductVendorTransferController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProductVendorTransfer.list(params), model:[productVendorTransferInstanceCount: ProductVendorTransfer.count()]
    }

    def show(ProductVendorTransfer productVendorTransferInstance) {
        respond productVendorTransferInstance
    }

    def create() {
        respond new ProductVendorTransfer(params)
    }

    @Transactional
    def save(ProductVendorTransfer productVendorTransferInstance) {
        if (productVendorTransferInstance == null) {
            notFound()
            return
        }

        if (productVendorTransferInstance.hasErrors()) {
            respond productVendorTransferInstance.errors, view:'create'
            return
        }

        productVendorTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productVendorTransferInstance.label', default: 'ProductVendorTransfer'), productVendorTransferInstance.id])
                redirect productVendorTransferInstance
            }
            '*' { respond productVendorTransferInstance, [status: CREATED] }
        }
    }

    def edit(ProductVendorTransfer productVendorTransferInstance) {
        respond productVendorTransferInstance
    }

    @Transactional
    def update(ProductVendorTransfer productVendorTransferInstance) {
        if (productVendorTransferInstance == null) {
            notFound()
            return
        }

        if (productVendorTransferInstance.hasErrors()) {
            respond productVendorTransferInstance.errors, view:'edit'
            return
        }

        productVendorTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductVendorTransfer.label', default: 'ProductVendorTransfer'), productVendorTransferInstance.id])
                redirect productVendorTransferInstance
            }
            '*'{ respond productVendorTransferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductVendorTransfer productVendorTransferInstance) {

        if (productVendorTransferInstance == null) {
            notFound()
            return
        }

        productVendorTransferInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductVendorTransfer.label', default: 'ProductVendorTransfer'), productVendorTransferInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productVendorTransferInstance.label', default: 'ProductVendorTransfer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
