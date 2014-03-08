package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AppointmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Appointment.list(params), model:[appointmentInstanceCount: Appointment.count()]
    }

    def show(Appointment appointmentInstance) {
        respond appointmentInstance
    }

    def create() {
        respond new Appointment(params)
    }

    @Transactional
    def save(Appointment appointmentInstance) {
        if (appointmentInstance == null) {
            notFound()
            return
        }

        if (appointmentInstance.hasErrors()) {
            respond appointmentInstance.errors, view:'create'
            return
        }

        appointmentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appointmentInstance.label', default: 'Appointment'), appointmentInstance.id])
                redirect appointmentInstance
            }
            '*' { respond appointmentInstance, [status: CREATED] }
        }
    }

    def edit(Appointment appointmentInstance) {
        respond appointmentInstance
    }

    @Transactional
    def update(Appointment appointmentInstance) {
        if (appointmentInstance == null) {
            notFound()
            return
        }

        if (appointmentInstance.hasErrors()) {
            respond appointmentInstance.errors, view:'edit'
            return
        }

        appointmentInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Appointment.label', default: 'Appointment'), appointmentInstance.id])
                redirect appointmentInstance
            }
            '*'{ respond appointmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Appointment appointmentInstance) {

        if (appointmentInstance == null) {
            notFound()
            return
        }

        appointmentInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Appointment.label', default: 'Appointment'), appointmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appointmentInstance.label', default: 'Appointment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def calendar(){
		
		def parameter = [:]
		def valueString
//		if (event){
//			valueString = "[{title: '[ 1�� 9999 ]',start: new Date(y, m, 1,11,30),end: new Date(y, m, 1,12,30),color: '#acacac',editable: false,allDay: false},{title: '[ ���� ������� ]',start: new Date(y, m, d-5,8,0),end: new Date(y, m, d-2,8,0),color: '#acacac',editable: false,allDay: false},{id: 999,title: '[ 1�� 2222 ]',start: new Date(y, m, d-3, 16, 0),end: new Date(y, m, d-3, 18, 0),color: '#acacac',editable: false,allDay: false}]"
//}
//				
//		
//		else{
			
			valueString = "[{id: 999,title: '[ ˡ 1452 ]',start: new Date(y, m, d+4, 16, 0),end: new Date(y, m, d+3, 18, 0),allDay: false},{title: '[ �� 4532 ]',start: new Date(y, m, d, 10, 30),end: new Date(y, m, d, 14, 0),allDay: false}]"
	//	}
		
		parameter.result = valueString
		
		render(view: "calendar", model: parameter)
		
	}
	
	def getEvents(boolean event){
		//def parameter = [:]
		def valueString
		if (event){
			valueString = "[{title: '[ 1�� 9999 ]',start: new Date(y, m, 1,11,30),end: new Date(y, m, 1,12,30),color: '#acacac',editable: false,allDay: false},{title: '[ ���� ������� ]',start: new Date(y, m, d-5,8,0),end: new Date(y, m, d-2,8,0),color: '#acacac',editable: false,allDay: false},{id: 999,title: '[ 1�� 2222 ]',start: new Date(y, m, d-3, 16, 0),end: new Date(y, m, d-3, 18, 0),color: '#acacac',editable: false,allDay: false}]"
			}else{
			valueString = "[{id: 999,title: '[ ˡ 1452 ]',start: new Date(y, m, d+4, 16, 0),end: new Date(y, m, d+3, 18, 0),allDay: false},{title: '[ �� 4532 ]',start: new Date(y, m, d, 10, 30),end: new Date(y, m, d, 14, 0),allDay: false}]"
			}
		respond valueString
		//parameter.result = valueString
		
		//render(view: "inputWheel", model: parameter)		
		
	}
}
