package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class MaxWheelColorController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MaxWheelColor.list(params), model:[maxWheelColorInstanceCount: MaxWheelColor.count()]
    }

    def show(MaxWheelColor maxWheelColorInstance) {
		def u = springSecurityService.currentUser
		params.branch = u.branch
		params.prodID = maxWheelColorInstance.id
        respond maxWheelColorInstance
    }

    def create() {
		params.prodType = ProductType.WHEEL
		params.stock = 0
        respond new MaxWheelColor(params)
    }

    @Transactional
    def save(MaxWheelColor maxWheelColorInstance) {
        if (maxWheelColorInstance == null) {
            notFound()
            return
        }

        if (maxWheelColorInstance.hasErrors()) {
            respond maxWheelColorInstance.errors, view:'create'
            return
        }
		maxWheelColorInstance.productType = ProductType.WHEEL
        maxWheelColorInstance.save flush:true
		println 'stock = '+ params.stock
		if(params.stock){
			def u = springSecurityService.currentUser
			Branch b = u.branch
			ProductStock maxWheel = new ProductStock()
			maxWheel.initialProductStock(b, maxWheelColorInstance)
			maxWheel.stock = params.stock.toInteger()
			maxWheel.save()
		}

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maxWheelColorInstance.label', default: 'MaxWheelColor'), maxWheelColorInstance.id])
                redirect maxWheelColorInstance
            }
            '*' { respond maxWheelColorInstance, [status: CREATED] }
        }
    }

    def edit(MaxWheelColor maxWheelColorInstance) {
		params.prodType = ProductType.WHEEL
        respond maxWheelColorInstance
    }

    @Transactional
    def update(MaxWheelColor maxWheelColorInstance) {
        if (maxWheelColorInstance == null) {
            notFound()
            return
        }

        if (maxWheelColorInstance.hasErrors()) {
            respond maxWheelColorInstance.errors, view:'edit'
            return
        }

        maxWheelColorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MaxWheelColor.label', default: 'MaxWheelColor'), maxWheelColorInstance.id])
                redirect maxWheelColorInstance
            }
            '*'{ respond maxWheelColorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MaxWheelColor maxWheelColorInstance) {

        if (maxWheelColorInstance == null) {
            notFound()
            return
        }

        maxWheelColorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MaxWheelColor.label', default: 'MaxWheelColor'), maxWheelColorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maxWheelColorInstance.label', default: 'MaxWheelColor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
