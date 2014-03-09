package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class WheelBandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond WheelBand.list(params), model:[wheelBandInstanceCount: WheelBand.count()]
    }

    def show(WheelBand wheelBandInstance) {
        respond wheelBandInstance
    }

    def create() {
        respond new WheelBand(params)
    }

    @Transactional
    def save(WheelBand wheelBandInstance) {
        if (wheelBandInstance == null) {
            notFound()
            return
        }

        if (wheelBandInstance.hasErrors()) {
            respond wheelBandInstance.errors, view:'create'
            return
        }

        wheelBandInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'wheelBandInstance.label', default: 'WheelBand'), wheelBandInstance.id])
                redirect wheelBandInstance
            }
            '*' { respond wheelBandInstance, [status: CREATED] }
        }
    }

    def edit(WheelBand wheelBandInstance) {
        respond wheelBandInstance
    }

    @Transactional
    def update(WheelBand wheelBandInstance) {
        if (wheelBandInstance == null) {
            notFound()
            return
        }

        if (wheelBandInstance.hasErrors()) {
            respond wheelBandInstance.errors, view:'edit'
            return
        }

        wheelBandInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'WheelBand.label', default: 'WheelBand'), wheelBandInstance.id])
                redirect wheelBandInstance
            }
            '*'{ respond wheelBandInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(WheelBand wheelBandInstance) {

        if (wheelBandInstance == null) {
            notFound()
            return
        }

        wheelBandInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'WheelBand.label', default: 'WheelBand'), wheelBandInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'wheelBandInstance.label', default: 'WheelBand'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
