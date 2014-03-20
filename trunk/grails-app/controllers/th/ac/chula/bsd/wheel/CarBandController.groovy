package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarBandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarBand.list(params), model:[carBandInstanceCount: CarBand.count()]
    }

    def show(CarBand carBandInstance) {
        respond carBandInstance
    }

    def create() {
        respond new CarBand(params)
    }

    @Transactional
    def save(CarBand carBandInstance) {
        if (carBandInstance == null) {
            notFound()
            return
        }

        if (carBandInstance.hasErrors()) {
            respond carBandInstance.errors, view:'create'
            return
        }

        carBandInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carBandInstance.label', default: 'CarBand'), carBandInstance.bandName])
                redirect carBandInstance
            }
            '*' { respond carBandInstance, [status: CREATED] }
        }
    }

    def edit(CarBand carBandInstance) {
        respond carBandInstance
    }

    @Transactional
    def update(CarBand carBandInstance) {
        if (carBandInstance == null) {
            notFound()
            return
        }

        if (carBandInstance.hasErrors()) {
            respond carBandInstance.errors, view:'edit'
            return
        }

        carBandInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CarBand.label', default: 'CarBand'), carBandInstance.bandName])
                redirect carBandInstance
            }
            '*'{ respond carBandInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarBand carBandInstance) {

        if (carBandInstance == null) {
            notFound()
            return
        }

        carBandInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarBand.label', default: 'CarBand'), carBandInstance.bandName])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carBandInstance.label', default: 'CarBand'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
