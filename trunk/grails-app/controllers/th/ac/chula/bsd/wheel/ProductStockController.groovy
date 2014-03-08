package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProductStockController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ProductStock.list(params), model:[productStockInstanceCount: ProductStock.count()]
    }

    def show(ProductStock productStockInstance) {
        respond productStockInstance
    }

    def create() {
        respond new ProductStock(params)
    }

    @Transactional
    def save(ProductStock productStockInstance) {
        if (productStockInstance == null) {
            notFound()
            return
        }

        if (productStockInstance.hasErrors()) {
            respond productStockInstance.errors, view:'create'
            return
        }

        productStockInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productStockInstance.label', default: 'ProductStock'), productStockInstance.id])
                redirect productStockInstance
            }
            '*' { respond productStockInstance, [status: CREATED] }
        }
    }

    def edit(ProductStock productStockInstance) {
        respond productStockInstance
    }

    @Transactional
    def update(ProductStock productStockInstance) {
        if (productStockInstance == null) {
            notFound()
            return
        }

        if (productStockInstance.hasErrors()) {
            respond productStockInstance.errors, view:'edit'
            return
        }

        productStockInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductStock.label', default: 'ProductStock'), productStockInstance.id])
                redirect productStockInstance
            }
            '*'{ respond productStockInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductStock productStockInstance) {

        if (productStockInstance == null) {
            notFound()
            return
        }

        productStockInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductStock.label', default: 'ProductStock'), productStockInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productStockInstance.label', default: 'ProductStock'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
