package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarColorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarColor.list(params), model:[carInstanceCount: CarColor.count()]
    }

    def show(CarColor carInstance) {
        respond carInstance
    }

    def create() {
        respond new CarColor(params)
    }

    @Transactional
    def save(CarColor carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'create'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carInstance.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*' { respond carInstance, [status: CREATED] }
        }
    }

    def edit(CarColor carInstance) {
        respond carInstance
    }

    @Transactional
    def update(CarColor carInstance) {
        if (carInstance == null) {
            notFound()
            return
        }

        if (carInstance.hasErrors()) {
            respond carInstance.errors, view:'edit'
            return
        }

        carInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect carInstance
            }
            '*'{ respond carInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarColor carInstance) {

        if (carInstance == null) {
            notFound()
            return
        }

        carInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Car.label', default: 'Car'), carInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carInstance.label', default: 'Car'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
