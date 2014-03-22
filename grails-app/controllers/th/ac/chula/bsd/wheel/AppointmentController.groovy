package th.ac.chula.bsd.wheel

import static org.springframework.http.HttpStatus.*

import java.text.DateFormat;
import java.text.SimpleDateFormat
import java.util.Locale;

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

	def timeFormat = new SimpleDateFormat('HH:mm', Locale.US)
	def shortDateFormat = new SimpleDateFormat('yyyy-MM-dd', Locale.US)
	def dateTimeFormat = new SimpleDateFormat('yyyy-MM-dd HH:mm', Locale.US)
	
	def displayDateTimeFormat = new SimpleDateFormat('dd-MM-yyyy HH:mm', Locale.US)
	
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
	
	def appointmentStuck(){
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()

		def appointLists = Appointment.withCriteria {
			eq('branch.id', b.id)
			ge('endDate', new Date())
			//not {'in'("status",[AppointmentStatus.CAR_RETURNED, AppointmentStatus.IDEL, AppointmentStatus.CANCEL, AppointmentStatus.INPROCESS])}
			'in'("status",[AppointmentStatus.NEW, AppointmentStatus.INSTALL_FINISED])
			and {
				order('startDate', 'asc')
				order('customerName', 'asc')
			}
		}
		println('appoint size = ' + appointLists.size())
		//respond appointLists.subList(params.int('offset') ? params.int('offset') - 1: 0, params.max), model:[appointmentInstanceCount: appointLists.size()]
		respond appointLists, model:[appointmentInstanceCount: appointLists.size()]
	}
	
	@Transactional
	def idelAppointment(Appointment appointmentInstance){
		println 'idel'
		appointmentInstance.idelAppointment()
		appointmentInstance.save flush:true 
		
		redirect action: "appointmentStuck", method: "GET"
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
		println 'get Event Grid'
		def events = []
		
		// May
		println 'getEventsGrid';
		println 'param: ' + params.searchStr
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		// get appointment
		def appointDBs = []
		if(params.searchStr.length() == 0){
			println 'no key'
			appointDBs = Appointment.withCriteria {
				and{
					eq('branch.id', b.id)
					not {'in'("status",[AppointmentStatus.CANCEL, AppointmentStatus.CAR_RETURNED])}
				}
				and {
					order('startDate', 'asc')
					order('appointmentNo', 'asc')
					order('customerName', 'asc')
				}
			}
		}else{
			println 'has key'
			def key = '%'+params.searchStr+'%'
			appointDBs = Appointment.withCriteria {
			eq('branch.id', b.id)
			or{
				like('appointmentNo', key)
				like('customer.carCode', key)
				like('customer.customerName', key)
				like('customer.customerTel', key)
				}
			not {'in'("status",[AppointmentStatus.CANCEL, AppointmentStatus.CAR_RETURNED])}
			and {
				order('startDate', 'asc')
				order('appointmentNo', 'asc')
				order('customerName', 'asc')
				}
			}
		}
		
		for(ap in appointDBs){
			Appointment appoint = ap
			def item = [
				'appointmentID': appoint.id,
				'appointmentNo': appoint.appointmentNo,
				'customerName':appoint.customer.customerName,
				'carCode': appoint.customer.carCode,
				'startDate': displayDateTimeFormat.format(appoint.startDate),
				'endAppointDate': displayDateTimeFormat.format(appoint.endAppointmentDate),
				'endDate': displayDateTimeFormat.format(appoint.endDate),
				'status': appoint.status.name()
				]
			events.add(item)
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
	def getEventsForCreate(){
		
		println "getEvents Calendar"
		
		// May
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
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
		def newevent = [
			'title':ap.customer.carCode,
			'start': dateTimeFormat.format(ap.startDate),
			'end': dateTimeFormat.format(ap.endAppointmentDate),
			'allDay': false
		]
		session['currentAppointment'] = ap
		// End Test
		
		Date today = new Date()
		
		// Get workoff
		def workOffDBs = b.workdays.findAll{it -> it.workActive == false}
		def daysoff = []
		for(doff in workOffDBs){
			WorkDay wdayoff = doff
			def jsonItem = [day: wdayoff.convertDayCodeToStiong()]
			daysoff.add(jsonItem)
		}
		
		// Get Min workHour
		def minLists = WorkDay.withCriteria {
			and{
				order('startHour', 'asc')
				order('startMinute', 'asc')
			}
		}
		def minWork = minLists.find{it}
		def mintime = ''
		if(minWork.startMinute == 0){
			mintime = minWork.startHour+":00"
		} else if (minWork.startMinute < 10) {
			mintime = minWork.startHour+":0"+minWork.startMinute
		} else {
			mintime = minWork.startHour+":"+minWork.startMinute
		}
		
		// Get Max WorkHour
		def maxLists = WorkDay.withCriteria {
			and{
				order('endHour', 'desc')
				order('endMinute', 'desc')
			}
		}
		def maxWork = minLists.find{it}
		def maxtime = ''
		if(maxWork.startMinute == 0){
			maxtime = maxWork.endHour+":00"
		} else if (maxWork.endMinute < 10) {
			maxtime = maxWork.endHour+":0"+maxWork.endMinute
		} else {
			maxtime = maxWork.endHour+":"+maxWork.endMinute
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
				'id': appoint.id,
				'title': appoint.customer.carCode,
				'start': dateTimeFormat.format(appoint.startDate),
				'end': dateTimeFormat.format(appoint.endDate),
				'color': appointmentColorCode,
				'editable': false,
				'allDay': false
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
		/*
		def newevent = [
			'id': '1',
			'title':'Barny',
			'start': '2014-03-20 12:00',
			'end': '2014-03-20 12:30',
			'allDay': false
		]
		*/
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
		def details = ['appointmentNo':'00000','price':'4,900']
			
		//def js = ['daysoff':daysoff,'holidays':holidays]
		
		def js = ['maxtime':maxtime,'mintime':mintime,'events':events,'daysoff':daysoff,'holidays':holidays,'newevent':newevent,'details':['a':'a']];
		render js as JSON
	}
	
	def getEventsForEdit(){
		println "getEvents Edit Calendar id: "+ params.id
		def apID = params.id
		// May
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		Appointment ap = Appointment.get(apID)
		println 'ap : ' + ap
		def currentEvent = [
			'id':ap.id,
			'title':ap.customer.carCode,
			'start': dateTimeFormat.format(ap.startDate),
			'end': dateTimeFormat.format(ap.endAppointmentDate),
			'allDay': false
		]
		session['currentAppointment'] = ap
		
		def details = [ 
			'appointmentNo': ap.appointmentNo,
			'carNo': ap.customer.carCode,
			'customerName':ap.customer.customerName,
			'status':ap.status.name()]
		
		
		Date today = new Date()
		
		// Get workoff
		def workOffDBs = b.workdays.findAll{it -> it.workActive == false}
		def daysoff = []
		for(doff in workOffDBs){
			WorkDay wdayoff = doff
			def jsonItem = [day: wdayoff.convertDayCodeToStiong()]
			daysoff.add(jsonItem)
		}
		
		// Get Min workHour
		def minLists = WorkDay.withCriteria {
			and{
				order('startHour', 'asc')
				order('startMinute', 'asc')
			}
		}
		def minWork = minLists.find{it}
		def mintime = ''
		if(minWork.startMinute == 0){
			mintime = minWork.startHour+":00"
		} else if (minWork.startMinute < 10) {
			mintime = minWork.startHour+":0"+minWork.startMinute
		} else {
			mintime = minWork.startHour+":"+minWork.startMinute
		}
		
		// Get Max WorkHour
		def maxLists = WorkDay.withCriteria {
			and{
				order('endHour', 'desc')
				order('endMinute', 'desc')
			}
		}
		def maxWork = minLists.find{it}
		def maxtime = ''
		if(maxWork.startMinute == 0){
			maxtime = maxWork.endHour+":00"
		} else if (maxWork.endMinute < 10) {
			maxtime = maxWork.endHour+":0"+maxWork.endMinute
		} else {
			maxtime = maxWork.endHour+":"+maxWork.endMinute
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
				
		def js = ['maxtime':maxtime,'mintime':mintime,'events':events,'daysoff':daysoff,'holidays':holidays,'currentEvent':currentEvent,'details':details];
		render js as JSON
	}
	
	def validateDeltaTime(){ // when drag
		println "vali Delta dateTime"
		println "startdate = " + params.startDate
		println "id = " + params.id
		println "apID = "+params.apID
		println "time = " + params.time
		println "act = " : params.act
		println "params.event = " + params.event
		println "params.dayDelta = "+ params.dayDelta
		println "params.minuteDelta = " + params.minuteDelta
		
		Boolean isValid = false
		
		//May
		Appointment ap = null
		if (params.id == null){ // For new Appointment
			println "act = " : params.act
			println "startdate = " + params.startDate
			println "id = " + params.id
			
			ap = session['currentAppointment']
		}else{ // For edit Appointment
			ap = Appointment.get(params.id.toInteger())
		}
		println 'ap : '+ ap
		def calendar = new GregorianCalendar()
		calendar.setTime(ap.startDate)
		calendar.add(calendar.DATE, params.dayDelta.toInteger())
		calendar.add(calendar.MINUTE, params.minuteDelta.toInteger())
		Date newDate = calendar.getTime()
		isValid = ap.checkValidAppointment(newDate)
		
		def js = ['isValid': isValid]
		render js as JSON
	}
	
	def validateSelectTime(){ // when
		println "vali Select dateTime"
		println "vali Delta dateTime"
		println "startdate = " + params.startDate
		println "id = " + params.id
		println "apID = "+ params.apID
		println "time = " + params.time
		println "act = " : params.act
		println "params.event = " + params.event
		println "params.dayDelta = "+ params.dayDelta
		println "params.minuteDelta = " + params.minuteDelta
		
		Boolean isValid = false
		
		//May
		Appointment ap = null
		if (params.id == null){ // For new Appointment
			println "act = " : params.act
			println "startdate = " + params.startDate
			println "id = " + params.id
			
			ap = session['currentAppointment']
		}else{ // For edit Appointment
			ap = Appointment.get(params.id.toInteger())
		}
		println 'ap : '+ ap
		def newCalendar = new GregorianCalendar()
		newCalendar.setTime(shortDateFormat.parse(params.startDate))
		
		def calendar = new GregorianCalendar()
		calendar.setTime(ap.startDate)
		
		newCalendar.set(Calendar.HOUR, calendar.get(Calendar.HOUR))
		newCalendar.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE))

		Date newDate = newCalendar.getTime()
		println 'newDate = '+ newDate
		isValid = ap.checkValidAppointment(newDate)
		println 'isValid = '+isValid
		def js = ['isValid': isValid]
		render js as JSON
	}
	
	def saveEvent(){
		
		println "name = "+ params.name
		println "start = "+ params.start
		println "address = "+ params.address
		println "tel = "+ params.tel
		println "carCode = "+ params.carCode
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
		js = [isValid: true]
		
		render js as JSON
//		def dateRecieveInstance = new DateRecieveInstance()
//		dateRecieveInstance.startTime = xxx
//		dateRecieveInstance.title = params.title
//		dateRecieveInstance.save(flush:true)
	}
	
	@Transactional
	def editEvent(){
		
		println "editEvent"
		println "id = "+params.id
		println "startdate "+ params.start
		Date newStart = new Date(new Date().parse(params.start))
		
		Appointment ap = Appointment.get(params.id.toInteger())
		ap.calStartEndAppointment(newStart)
		ap.confirmAppointment(false)
		ap.status = AppointmentStatus.NEW
		Boolean isSave = ap.save flush:true 
		
		def js = [isValid: isSave]

		render js as JSON
	}

	@Transactional
	def returnCar(){
		def u = springSecurityService.currentUser
		Appointment ap = Appointment.get(params.id.toInteger())
		Boolean isSuccess = ap.checkReturnCar(u)
		if(isSuccess){
			ap.save flush:true
		}
		println 'isSuccess: '+ isSuccess
		def js = [isValid: isSuccess]
		render js as JSON
	}
	
	@Transactional
	def install(){
		def u = springSecurityService.currentUser		
		Appointment ap = Appointment.get(params.id.toInteger())
		Boolean isSuccess = ap.beginInstall(u)

		if(isSuccess){
			ap.save flush:true
		}
		
		def js = [isValid: isSuccess]
		render js as JSON
	}	
	
	
}
