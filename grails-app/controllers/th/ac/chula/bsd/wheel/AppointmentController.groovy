package th.ac.chula.bsd.wheel

import static org.springframework.http.HttpStatus.*

import java.text.DateFormat;
import java.text.SimpleDateFormat

import th.ac.chula.bsd.inventory.PreProductPurchaseLine;
import th.ac.chula.bsd.inventory.PreProductPurchaseStatus;
import th.ac.chula.bsd.inventory.PreProductTransferLine;
import th.ac.chula.bsd.inventory.ProductPurchase;
import th.ac.chula.bsd.inventory.ProductPurchaseLine;
import th.ac.chula.bsd.inventory.ProductPurchaseStatus;
import th.ac.chula.bsd.inventory.ProductTransferLine;
import th.ac.chula.bsd.inventory.PurchasePaymentType;
import th.ac.chula.bsd.inventory.ReceivePurchase;
import th.ac.chula.bsd.security.User;
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class AppointmentController {
	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		params.max = Math.min(max ?: 10, 100)
		params.offset = params.int('offset') ?: 0
		
		params.keyword = params.keyword ?: ''
		params.keyword = params.keyword.trim()
		def key = '%'+params.keyword+'%'
		println 'keyword = '+key
		
		println 'params.offser='+params.offset
		println 'params.max='+params.max
		def appointLists = Appointment.withCriteria {
			eq('branch.id', b.id)
			or{
			like('customer.carCode', key)
			like('customer.customerName', key)
			like('customer.customerTel', key)
		}
			and {
				order('startDate', 'asc')
				order('customerName', 'asc')
			}
			//maxResults(new Integer( params.max))
            //firstResult(new Integer(params.offset))
		}
		println('appoint size = ' + appointLists.size())
		//respond appointLists.subList(params.int('offset') ? params.int('offset') - 1: 0, params.max), model:[appointmentInstanceCount: appointLists.size()]
        respond Appointment.list(params), model:[appointmentInstanceCount: Appointment.count()]
    }
	
	def showSearch = {
		render (view: 'index')
	}
	
	def search = {
		def key = '%%'
		if(params.keyword) {
			key = '%'+params.keyword+'%'
		} 
		def appointLists = Appointment.withCriteria {
			eq('branch.id', b.id)
			or{
			like('customer.carCode', key)
			like('customer.customerName', key)
			like('customer.customerTel', key)
		}
			and {
				order('startDate', 'asc')
				order('customerName', 'asc')
			}
			//maxResults(new Integer( params.max))
			//firstResult(new Integer(params.offset))
		}
		render(template:'searchResults', model:[appointmentInstanceList: appointLists, appointmentInstanceCount: appointLists.size()])
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
	
	
	@Transactional
	def test() {
		
		//User u = session.user
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		
		// Test Calendar
		def holidayList = b.getAllHoliday(new Date()) //b.getAllHolidayAndCloseDay(new Date())
		println('Holiday num : '+holidayList.size())
		
		def appointmentList = b.getAllAppointmentInMonth(new Date())
		println('Appoint num : '+appointmentList.size())
		
		
		// Test Appointment
		Appointment ap = new Appointment()
		ap.initialAppointment(u, b)
		
		ap.addProduct(u, 1, 1)
		println '1 Total :' + ap.installTotal
		println '1 StartDate : '+ ap.startDate + ' EndDate : '+ ap.endDate
		ap.addProduct(u, 3, 4)
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
		// Test Transfer - request Transfer
		b.refresh()
		Branch b2 = Branch.get(2)
		User u2 = User.get(2)
		def b1pre = PreProductTransferLine.withCriteria {
			eq('branch.id', b.id)
		}
		if(b1pre.size() > 0){
			PreProductTransferLine.withTransaction{ session ->
				PreProductTransferLine exampleTran = b1pre.find{it}
				int transAmt = exampleTran.amount - 2
				exampleTran.addProductTransferLine(u2, b2, transAmt)
				Boolean isSave = exampleTran.save flush:true
				if (!isSave) {
					exampleTran.errors.each {
						println it
					}
				} else {
					println ('Request Transfer Success : '+ exampleTran.status)
				}
			}
		}
		
		// Test Transfer - make Transfer
		b2.refresh()
		def transToB2Lists = b2.getTransferFromOtherBranch()
		println("Branch 2 Transfer list : "+ transToB2Lists.size())
		if(transToB2Lists.size() > 0){
			ProductTransferLine.withTransaction{ session ->
				ProductTransferLine pTransfer = transToB2Lists.find{it}	
				println("Transfer amt : "+ pTransfer.amount)
				pTransfer.beginTransferProduct(u2)
				Boolean isSave = pTransfer.save flush:true
				if (!isSave) {
					pTransfer.errors.each {
						println it
					}
				} else {
					println ('Transfer Success : '+ pTransfer.status)
				}
			}
		}
		
		// Test Transfer - receive Transfer
		b.refresh()
		def transFromB1Lists = b.getTransferOfBranch()
		println("Branch 1 Transfer list : "+transFromB1Lists.size())
		if(transFromB1Lists.size() > 0){
			ProductTransferLine.withTransaction{ session ->
				ProductTransferLine pTransfer = transFromB1Lists.find{it}
				println("Receive amt : "+ pTransfer.amount)
				pTransfer.receiveTransfer(u)
				Boolean isSave = pTransfer.save flush:true
				if (!isSave) {
					pTransfer.errors.each {
						println it
					}
				} else {
					println ('Receive Transfer Success : '+ pTransfer.status)
				}
			}
		}
		*/
		/*
		// Test Purchase - make Purchase
		b.refresh()
		def b1prePur = PreProductPurchaseLine.withCriteria {
			and{
				eq('branch.id', b.id)
				eq('status', PreProductPurchaseStatus.NEW)
			}
		}
		if(b1prePur.size() > 0){
			PreProductPurchaseLine.withTransaction{ session ->
				PurchasePaymentType payType = PurchasePaymentType.get(1)
				Vendor vendor = Vendor.get(1)
				
				// Create PO Header
				ProductPurchase purchase = new ProductPurchase()
				purchase.initialProductPurchase(b, u, "PO0001", payType, vendor)
				
				for(preItem in b1prePur){				
					PreProductPurchaseLine examplePurchase = preItem
					examplePurchase.purchasing(u)
					purchase.addProductPurchaseLine(u, examplePurchase.product, examplePurchase.amount, 0)
				}

				println('Vat rate = '+purchase.vat)
				Boolean isSuccess = purchase.confirmPurchasing()
				println('purchase success = ' + isSuccess + ' with line : ' + purchase.purchaseLines.size())
				
				isSave = purchase.save flush:true
				if (!isSave) {
					purchase.errors.each {
						println it
					}
				} else {
					println ('Create PO Success status:'+ purchase.status+', Total = '+ purchase.calTotal()+' , Vat = ' + purchase.calVat() + ', Net Total = '+ purchase.totalPrice)
				}
			}
		}
		*/
		/*
		// Test Purchase - receive Purchase
		 b.refresh()
		 def purs = ProductPurchase.withCriteria {
			 and{
				 eq('branch.id', b.id)
				 or{
					 eq('status', ProductPurchaseStatus.WAITING_RECEIVE)
					 eq('status', ProductPurchaseStatus.NEW)
					 eq('status', ProductPurchaseStatus.PURCHASING)
				 }
			 }
		 }
		 if(purs.size() > 0){
			 ProductPurchase.withTransaction{ session ->
				 ProductPurchase pur = purs.find{it}
				 
				 String recID = 'REC001'
				 ReceivePurchase recHeader = new ReceivePurchase()
				 recHeader.initialReceivePurchase(pur, u, recID)
				 
				 for(pl in pur.purchaseLines){
					 ProductPurchaseLine purline = pl
					 
					 println('Product: '+purline.product.prodName + ' stock befor rec: ' + b.getProductStock(purline.product).stock)
					 
					 recHeader.addReceivePurchaseLine(purline.product, purline.amount)
					 println('Product: '+purline.product.prodName + ' stock after rec: ' + b.getProductStock(purline.product).stock)
					 
					 //println('purchase line status : '+ purline.status)
				 }
				 
				 pur.receivePurchase(recHeader, u)
				 //pur.checkReceivePurchaseStatus()
				 println('PO status = ' + pur.status)
				 isSave = pur.save flush:true
				 if (!isSave) {
					 pur.errors.each {
						 println it
					 }
				 } else {
					 println ('Create PO Success : '+ pur.status)
				 }
			 }
		 }
		*/
		// Test Install - Prepare
		
		// Test Install - Installing
		
		// Test Install - Install Finish
		
		// Test Appointment - Receive Car
		
		
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
	def appointmentGrid(){
		return
	}
	def getEventsGrid(){
		
		// default search all when "searchStr" = string empty
		println "getEventsGrid"
		println "searchStr = " + params.searchStr;
		
		def events = []
		
		//appointmentID is hidden fields
		def responseData = [
			'appointmentID': '001',
			'appointmentNo': '1',
			'CustomerName':'Panda',
			'CarCode': 'PD 1234',
			'StartDate': '2014-03-17 9:30',
			'EndDate': '2014-03-17 10:30',
			'Status': 'New'
		]

		def responseData2 = [
			'appointmentID': '002',
			'appointmentNo': '2',
			'CustomerName':'Barny',
			'CarCode': 'Barny 1234',
			'StartDate': '2014-03-14 12:00',
			'EndDate': '2014-03-14 12:30',
			'Status': 'miss'
		]
		
		def responseData3 = [
			'appointmentID': '003',
			'appointmentNo': '3',
			'CustomerName':'Scott',
			'CarCode': 'Scott 1234',
			'StartDate': '2014-03-20 12:00',
			'EndDate': '2014-03-20 12:30',
			'Status': 'Cancel'
			
		]
		
		if (params.searchStr == ""){
		events.add(responseData)
		events.add(responseData2)
		events.add(responseData3)
		}
		else{
			events.add(responseData)
			events.add(responseData2)
		}
		
		render events as JSON
		
	}
	
	def appointmentCalendar(){
		return
	}
	
	def manageCalendar(){
		return
	}
	
	
	static String appointmentColorCode = '00ff00'
	def getEvents(){
		
		println "getEvents"
		
		// May
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		Date today = new Date()
		DateFormat shortDateFormat = new SimpleDateFormat('yyyy-MM-dd')
		DateFormat dateTimeFormat = new SimpleDateFormat('yyyy-MM-dd HH:mm')
		
		// Get workoff
		def workOffDBs = b.workdays.findAll{it -> it.workActive == false}
		def daysoff = []
		for(doff in workOffDBs){
			WorkDay wdayoff = doff
			def jsonItem = [day: wdayoff.convertDayCodeToStiong()]
			daysoff.add(jsonItem)
		}
		
		// Get Holiday
		def holidayDBs = b.getAllHoliday(today)
		def holidays = []
		for(hitem in holidayDBs){
			Holiday holiday = hitem
			def jsonItem = [ day: shortDateFormat.format(holiday.holidayDate) ]
			holidays.add(jsonItem)
		}
		
		// Get Appointment
		def appointDBs = b.getAllAppointmentInMonth(today)
		def events = []
		for(app in appointDBs){
			Appointment appoint = app
			def jsonItem = [
				id: appoint.id,
				title: appoint.customer.carCode,
				start: dateTimeFormat.format(appoint.startDate),
				end: dateTimeFormat.format(appoint.endDate),
				color: appointmentColorCode,
				editable: false,
				allDay: false
				]
			events.add(jsonItem)
		}
		
		// end May
		
		
		
		/*
		def events = []
		def responseData = [
			'id': '999',
			'title':'Panda',
			'start': '2014-03-17 9:30',
			'end': '2014-03-17 10:30',
			'allDay': false
		]

		def responseData2 = [
			'id': '20',
			'title':'Scott',
			'start': '2014-03-14 12:00',
			'end': '2014-03-14 12:30',
			'allDay': false
		]
		*/
		def newevent = [
			'id': '1',
			'title':'Barny',
			'start': '2014-03-20 12:00',
			'end': '2014-03-20 12:30',
			'allDay': false
		]
		/*
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
		*/
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
		
		//def daysoff = [[ day: 'sat' ],[ day: 'sun' ]]
		//def holidays = [[ day: '2014-03-18' ],[ day: '2014-03-25' ]]
			
		//def js = ['daysoff':daysoff,'holidays':holidays]
		
		def js = ['maxtime':'22:00','mintime':'8:00','events':events,'daysoff':daysoff,'holidays':holidays,'newevent':newevent];
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
