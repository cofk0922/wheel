package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NutController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Nut.list(params), model:[nutInstanceCount: Nut.count()]
    }

    def show(Nut nutInstance) {
        respond nutInstance
    }

    def create() {
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

        nutInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nutInstance.label', default: 'Nut'), nutInstance.id])
                redirect nutInstance
            }
            '*' { respond nutInstance, [status: CREATED] }
        }
    }

    def edit(Nut nutInstance) {
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

        nutInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Nut.label', default: 'Nut'), nutInstance.id])
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
