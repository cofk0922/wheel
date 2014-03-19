package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HolidayController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Holiday.list(params), model:[holidayInstanceCount: Holiday.count()]
    }

    def show(Holiday holidayInstance) {
        respond holidayInstance
    }

    def create() {
        respond new Holiday(params)
    }

    @Transactional
    def save(Holiday holidayInstance) {
        if (holidayInstance == null) {
            notFound()
            return
        }

        if (holidayInstance.hasErrors()) {
            respond holidayInstance.errors, view:'create'
            return
        }

        holidayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'holidayInstance.label', default: 'Holiday'), holidayInstance.id])
                redirect holidayInstance
            }
            '*' { respond holidayInstance, [status: CREATED] }
        }
    }

    def edit(Holiday holidayInstance) {
        respond holidayInstance
    }

    @Transactional
    def update(Holiday holidayInstance) {
        if (holidayInstance == null) {
            notFound()
            return
        }

        if (holidayInstance.hasErrors()) {
            respond holidayInstance.errors, view:'edit'
            return
        }

        holidayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Holiday.label', default: 'Holiday'), holidayInstance.id])
                redirect holidayInstance
            }
            '*'{ respond holidayInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Holiday holidayInstance) {

        if (holidayInstance == null) {
            notFound()
            return
        }

        holidayInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Holiday.label', default: 'Holiday'), holidayInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'holidayInstance.label', default: 'Holiday'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
