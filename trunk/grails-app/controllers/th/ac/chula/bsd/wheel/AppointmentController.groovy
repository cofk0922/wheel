package th.ac.chula.bsd.wheel

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class AppointmentController {
	def springSecurityService
	
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
	
	// May
	@Transactional
	def test() {
		
		//User u = session.user
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		Appointment ap = new Appointment()
		ap.initialAppointment(u, b)
		
		ap.addProduct(1, 1)
		println '1 Total :' + ap.installTotal
		println '1 StartDate : '+ ap.startDate + ' EndDate : '+ ap.endDate
		ap.addProduct(3, 10)
		println '2 Total :' + ap.installTotal
		println '2 StartDate : '+ ap.startDate + ' EndDate : '+ ap.endDate
		
		ap.setNewCustomer("A", "08xxxxxxx", "Bangkok", "ABC1234")
		
		ap.confirmAppointment(false)
		Boolean isSave = ap.save flush:true
		if (!ap.save()) {
			ap.errors.each {
				println it
			}
		}
		/*
		Branch b = session.user.branch;
		def wheelQ = Wheel.where{
			wheelStocks in WheelStock.where {
				branch.id == b.id
			}
		}.order('wheelName','asc')
	
		//def wheelList = Wheel.findAll("from Wheel as wh inner join fetch wh.wheelStocks as whStock where whStock.branch.id = ?", b.id);
		
		def wheelList = Wheel.createCriteria().list {
			createAlias("wheelStocks", "ws", CriteriaSpecification.LEFT_JOIN)
			createAlias("ws.branch", "br", CriteriaSpecification.LEFT_JOIN)
			eq("br.id", b.id)
			order("wheelName","asc")
		};
		
	println("Wheel List: "+ wheelList);
		def a = wheelList.size();
	
		render(view: "index", model: [wheel: wheelList])
		*/
	}
	
	// Bird
	def calendar(){
		return
	}
	
	def getEvents(boolean event){
		//def parameter = [:]
		def valueString
		if (event){
			valueString = "[{title: '[ 1ï¿½ï¿½ 9999 ]',start: new Date(y, m, 1,11,30),end: new Date(y, m, 1,12,30),color: '#acacac',editable: false,allDay: false},{title: '[ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ]',start: new Date(y, m, d-5,8,0),end: new Date(y, m, d-2,8,0),color: '#acacac',editable: false,allDay: false},{id: 999,title: '[ 1ï¿½ï¿½ 2222 ]',start: new Date(y, m, d-3, 16, 0),end: new Date(y, m, d-3, 18, 0),color: '#acacac',editable: false,allDay: false}]"
			}else{
			valueString = "[{id: 999,title: '[ Ë¡ 1452 ]',start: new Date(y, m, d+4, 16, 0),end: new Date(y, m, d+3, 18, 0),allDay: false},{title: '[ ï¿½ï¿½ 4532 ]',start: new Date(y, m, d, 10, 30),end: new Date(y, m, d, 14, 0),allDay: false}]"
			}
		respond valueString
		//parameter.result = valueString
		
		//render(view: "inputWheel", model: parameter)		
		
	}
	def jSonList(){
		
		println("ko");
		/// loop
		def jsonResult = []
		def responseData = [
			'title': '[ 1¡´ 9999 ]',
			'start': '2014-03-07',
			'end': '2014-03-10',
			'color': '#acacac'
		]

		def responseData2 = [
			'title': 'xxx',
			'start': '2014-03-08',
			'end': '2014-03-15',
			'color': '#acacac'
		]

		//	{ { "title": "All Day Event", "start": "2014-03-07" }, { "title": "Long Event", "start": "2014-03-07", "end": "2014-03-10" } }
		jsonResult.add(responseData)
		jsonResult.add(responseData2)
		
		// endloop
		render jsonResult as JSON
		
		//example
		
//		def jsonResult = results.collect{
//			[
//						customerId:it.customer.id,
//						customerName:it.customer.customerName,
//						customerSiteName:it.customerSiteName,
//						address:(it.addressBillToLine1?it.addressBillToLine1:"")+" "+(it.addressBillToLine2?it.addressBillToLine2:""),
//						subDistrict:it.addressBillToLine3?it.addressBillToLine3:"",
//						district:it.addressBillToLine4?it.addressBillToLine4:"",
//						province:it.provinceBillTo,
//						zipCode:it.zipBillTo,
//						creditTerm:it.termName,
//						customerTax:it.customer.customerTax?it.customer.customerTax:"-",
//						cdgCode:it.cdgCode,
//						customerSiteId:it.id,
//					]
//		}
//		def js = [total:results.getTotalCount(),rows:jsonResult]
//
//		render  js as JSON
		
	}
	
	def saveDate(){
		
				println "koko="+params.koko
		
	
//		def dateRecieveInstance = new DateRecieveInstance()
//		dateRecieveInstance.startTime = xxx
//
//		dateRecieveInstance.save(flush:true)
	}
	
}
