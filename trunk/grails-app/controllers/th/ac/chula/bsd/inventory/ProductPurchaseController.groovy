package th.ac.chula.bsd.inventory



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER', 'ROLE_TECH'])
@Transactional(readOnly = true)
class ProductPurchaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProductPurchase.list(params), model:[productPurchaseInstanceCount: ProductPurchase.count()]
    }

    def show(ProductPurchase productPurchaseInstance) {
        respond productPurchaseInstance
    }

    def create() {
        respond new ProductPurchase(params)
    }

    @Transactional
    def save(ProductPurchase productPurchaseInstance) {
        if (productPurchaseInstance == null) {
            notFound()
            return
        }

        if (productPurchaseInstance.hasErrors()) {
            respond productPurchaseInstance.errors, view:'create'
            return
        }

        productPurchaseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productPurchaseInstance.label', default: 'ProductPurchase'), productPurchaseInstance.id])
                redirect productPurchaseInstance
            }
            '*' { respond productPurchaseInstance, [status: CREATED] }
        }
    }

    def edit(ProductPurchase productPurchaseInstance) {
        respond productPurchaseInstance
    }

    @Transactional
    def update(ProductPurchase productPurchaseInstance) {
        if (productPurchaseInstance == null) {
            notFound()
            return
        }

        if (productPurchaseInstance.hasErrors()) {
            respond productPurchaseInstance.errors, view:'edit'
            return
        }

        productPurchaseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductPurchase.label', default: 'ProductPurchase'), productPurchaseInstance.id])
                redirect productPurchaseInstance
            }
            '*'{ respond productPurchaseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductPurchase productPurchaseInstance) {

        if (productPurchaseInstance == null) {
            notFound()
            return
        }

        productPurchaseInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductPurchase.label', default: 'ProductPurchase'), productPurchaseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPurchaseInstance.label', default: 'ProductPurchase'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
