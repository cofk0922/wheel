package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarWheelListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarWheelList.list(params), model:[carWheelListInstanceCount: CarWheelList.count()]
    }

    def show(CarWheelList carWheelListInstance) {
        respond carWheelListInstance
    }

    def create() {
        respond new CarWheelList(params)
    }

    @Transactional
    def save(CarWheelList carWheelListInstance) {
        if (carWheelListInstance == null) {
            notFound()
            return
        }

        if (carWheelListInstance.hasErrors()) {
            respond carWheelListInstance.errors, view:'create'
            return
        }

        carWheelListInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carWheelListInstance.label', default: 'CarWheelList'), carWheelListInstance.id])
                redirect carWheelListInstance
            }
            '*' { respond carWheelListInstance, [status: CREATED] }
        }
    }

    def edit(CarWheelList carWheelListInstance) {
        respond carWheelListInstance
    }

    @Transactional
    def update(CarWheelList carWheelListInstance) {
        if (carWheelListInstance == null) {
            notFound()
            return
        }

        if (carWheelListInstance.hasErrors()) {
            respond carWheelListInstance.errors, view:'edit'
            return
        }

        carWheelListInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CarWheelList.label', default: 'CarWheelList'), carWheelListInstance.id])
                redirect carWheelListInstance
            }
            '*'{ respond carWheelListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarWheelList carWheelListInstance) {

        if (carWheelListInstance == null) {
            notFound()
            return
        }

        carWheelListInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarWheelList.label', default: 'CarWheelList'), carWheelListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carWheelListInstance.label', default: 'CarWheelList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
