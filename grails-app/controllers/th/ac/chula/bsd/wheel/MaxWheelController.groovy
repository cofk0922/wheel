package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaxWheelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MaxWheel.list(params), model:[maxWheelInstanceCount: MaxWheel.count()]
    }

    def show(MaxWheel maxWheelInstance) {
        respond maxWheelInstance
    }

    def create() {
        respond new MaxWheel(params)
    }

    @Transactional
    def save(MaxWheel maxWheelInstance) {
        if (maxWheelInstance == null) {
            notFound()
            return
        }

        if (maxWheelInstance.hasErrors()) {
            respond maxWheelInstance.errors, view:'create'
            return
        }

        maxWheelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maxWheelInstance.label', default: 'MaxWheel'), maxWheelInstance.id])
                redirect maxWheelInstance
            }
            '*' { respond maxWheelInstance, [status: CREATED] }
        }
    }

    def edit(MaxWheel maxWheelInstance) {
        respond maxWheelInstance
    }

    @Transactional
    def update(MaxWheel maxWheelInstance) {
        if (maxWheelInstance == null) {
            notFound()
            return
        }

        if (maxWheelInstance.hasErrors()) {
            respond maxWheelInstance.errors, view:'edit'
            return
        }

        maxWheelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MaxWheel.label', default: 'MaxWheel'), maxWheelInstance.id])
                redirect maxWheelInstance
            }
            '*'{ respond maxWheelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MaxWheel maxWheelInstance) {

        if (maxWheelInstance == null) {
            notFound()
            return
        }

        maxWheelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MaxWheel.label', default: 'MaxWheel'), maxWheelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maxWheelInstance.label', default: 'MaxWheel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
