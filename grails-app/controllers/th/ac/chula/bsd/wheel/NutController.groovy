package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class NutController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		params.branch = u.branch
        params.max = Math.min(max ?: 10, 100)
        respond Nut.list(params), model:[nutInstanceCount: Nut.count()]
    }

    def show(Nut nutInstance) {
		def u = springSecurityService.currentUser
		params.branch = u.branch
		params.prodID = nutInstance.id
        respond nutInstance
    }

    def create() {
		params.prodType = ProductType.NUT
		params.stock = 0
        respond new Nut(params)
    }

    @Transactional
    def save(Nut nutInstance) {
        if (nutInstance == null) {
            notFound()
            return
        }

        if (nutInstance.hasErrors()) {
            respond nutInstance.errors, view:'create'
            return
        }
		nutInstance.productType = ProductType.NUT
        nutInstance.save flush:true
		println 'stock = '+ params.stock
		if(params.stock){
			def u = springSecurityService.currentUser
			Branch b = u.branch
			ProductStock newStock = new ProductStock()
			newStock.initialProductStock(b, nutInstance)
			newStock.stock = params.stock.toInteger()
			newStock.save()
		}
		
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nutInstance.label', default: 'Nut'), nutInstance.prodName])
                redirect nutInstance
            }
            '*' { respond nutInstance, [status: CREATED] }
        }
    }

    def edit(Nut nutInstance) {
		params.prodType = ProductType.NUT
        respond nutInstance
    }

    @Transactional
    def update(Nut nutInstance) {
        if (nutInstance == null) {
            notFound()
            return
        }

        if (nutInstance.hasErrors()) {
            respond nutInstance.errors, view:'edit'
            return
        }
		nutInstance.productType = ProductType.NUT
        nutInstance.save flush:true
		
		println 'stock = '+ params.stock
		if(params.stock){
			def u = springSecurityService.currentUser
			Branch b = u.branch
			
			ProductStock stock = b.getProductStock(nutInstance)
			if(stock){
				stock.stock = params.stock.toInteger()
			} else {
				stock = new ProductStock()
				stock.initialProductStock(b, nutInstance)
				stock.stock = params.stock.toInteger()
			}
			stock.save()
		}
		
        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Nut.label', default: 'Nut'), nutInstance.prodName])
                redirect nutInstance
            }
            '*'{ respond nutInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Nut nutInstance) {

        if (nutInstance == null) {
            notFound()
            return
        }

        nutInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Nut.label', default: 'Nut'), nutInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutInstance.label', default: 'Nut'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
