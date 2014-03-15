package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarModelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarModel.list(params), model:[carModelInstanceCount: CarModel.count()]
    }

    def show(CarModel carModelInstance) {
        respond carModelInstance
    }

    def create() {
        respond new CarModel(params)
    }
	
	def initialWheelListForNewCar(CarModel carModelInstance){
		try{
			performanceCheckingService.initialWheelListForNewCar(carModelInstance.id)
		}
		catch(e){
			flash.message "Can't Initial Wheel List"
		}
	}

    @Transactional
    def save(CarModel carModelInstance) {
        if (carModelInstance == null) {
            notFound()
            return
        }

        if (carModelInstance.hasErrors()) {
            respond carModelInstance.errors, view:'create'
            return
        }

		
        carModelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carModelInstance.label', default: 'CarModel'), carModelInstance.id])
                redirect carModelInstance
            }
            '*' { respond carModelInstance, [status: CREATED] }
        }
    }

    def edit(CarModel carModelInstance) {
        respond carModelInstance
    }

    @Transactional
    def update(CarModel carModelInstance) {
        if (carModelInstance == null) {
            notFound()
            return
        }

        if (carModelInstance.hasErrors()) {
            respond carModelInstance.errors, view:'edit'
            return
        }

        carModelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CarModel.label', default: 'CarModel'), carModelInstance.id])
                redirect carModelInstance
            }
            '*'{ respond carModelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarModel carModelInstance) {

        if (carModelInstance == null) {
            notFound()
            return
        }

        carModelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarModel.label', default: 'CarModel'), carModelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carModelInstance.label', default: 'CarModel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
