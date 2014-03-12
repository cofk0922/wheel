package th.ac.chula.bsd.wheel

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

//@Secured(['ROLE_ADMIN', 'ROLE_USER'])
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
	def appointmentCalendar(){
		return
	}
	
	def getEvents(){
		
		println "getEvents"
		
		def events = []
		def responseData = [
			'id': '999',
			'start': '2014-03-17 9:30',
			'end': '2014-03-17 10:30',
			'color': '#008e8e',
			'allDay': false
		]

		def responseData2 = [
			'id': '20',
			'start': '2014-03-14 12:00',
			'end': '2014-03-14 12:30',
			'color': '#008e8e',
			'allDay': false
		]
		
		//{
		//			id: 999,
		//			title: '[ CR7 2222 ]',
//					start: new Date(y, m, d-3, 16, 0),
//					end: new Date(y, m, d-3, 18, 0),
//					color: '#acacac',
//					editable: false,
//					url: 'http://google.com/',
//					allDay: false
//				},

		events.add(responseData)
		events.add(responseData2)
		
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
		
		def daysoff = [[ day: 'sat' ],[ day: 'sun' ]]
		def holidays = [[ day: '2014-03-18' ],[ day: '2014-03-25' ]]
			
		//def js = ['daysoff':daysoff,'holidays':holidays]
		
		def js = ['maxtime':'22:00','mintime':'8:00','events':events,'daysoff':daysoff,'holidays':holidays];
		render js as JSON
	}
		
	def validateTime(){
		println "validateTime"
		
		// if id = "null" that's mean add new event else meaning is edit event
		if (params.id == null){
			println "act = " : params.act
			println "startdate = " + params.startdate
			println "id = " + params.id
		}else{
		println "id = " + params.event
		println "act = " : params.act
		println "dayDelta = " + params.dayDelta
		println "minuteDelta = " + params.minuteDelta
		}
			
		//return
		def js = [isValid: true]
		render js as JSON
	}
	
	
	def editEvent(){
		
		println "editEvent"
		println "action = "+params.act
		println "id = "+params.id
		println "startdate "+ params.startdate
		println "dayDelta "+ params.dayDelta
		println "minuteDelta "+ params.minuteDelta
		def js = []
		if (params.act == "add"){
			
			js = [
				id: params.title+"-id",
				title: params.title,
				start: params.startdate,
				end:params.end,
				allDay: params.allDay
				]
		}else{
			js = [isValid: true]
		}
		render js as JSON
//		def dateRecieveInstance = new DateRecieveInstance()
		
//		dateRecieveInstance.startTime = xxx
//		dateRecieveInstance.title = params.title
//
//		dateRecieveInstance.save(flush:true)
	}
	
}
