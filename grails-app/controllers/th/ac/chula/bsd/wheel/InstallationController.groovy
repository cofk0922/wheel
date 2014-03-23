package th.ac.chula.bsd.wheel

import java.text.DateFormat;
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional
import grails.converters.JSON

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER', 'ROLE_TECH'])
@Transactional(readOnly = true)
class InstallationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	def timeFormat = new SimpleDateFormat('HH:mm',Locale.US)
	def shortDateFormat = new SimpleDateFormat('yyyy-MM-dd',Locale.US)
	def dateTimeFormat = new SimpleDateFormat('yyyy-MM-dd HH:mm',Locale.US)
	
	def springSecurityService
   @Transactional
    def index(Integer max) {
		def	listInstall= Installation.withCriteria {
		    or {
				eq("status",InstallationStatus.NEW)
				eq("status",InstallationStatus.PREPARE_INSTALL)
				eq("status",InstallationStatus.INSTALLING) 
			}
			and {
				order("startDate", "asc")
				order("endDate", "asc")
			}
		}
	/*	for (ins in listInstall ){
			//prinln('status:'+ins)
			
			if(ins == InstallationStatus.NEW){
				install.checkprepareInstall()
				install.save flush:true
				println 'Status PrepareInstall :' + install.status
			}
			elsif (ins == InstallationStatus.PREPARE_INSTALL){
				install.checkinstalling()
				install.save flush:true
				println 'Status Installing :' + install.status
			}
			elsif(ins == InstallationStatus.INSTALLING){
				install.checkfinished()
				install.save flush:true
				println 'Status Finished:' + install.status
			}
			 
		}*/
	 	def install = listInstall.find{it}
		install.checkprepareInstall()
		install.save flush:true
		println 'Status PrepareInstall :' + install.status
	 
		install.checkinstalling()
		install.save flush:true
		println 'Status Installing :' + install.status
		 
		install.checkfinished()
		install.save flush:true
		println 'Status Finished:' + install.status  
  
		/*
        params.max = Math.min(max ?: 10, 100)
        respond Installation.list(params), model:[installationInstanceCount: Installation.count()]
        */
    }

    def show(Installation installationInstance) {
        respond installationInstance
    }
    
 // Bird
 	def getEventDetails(){
 		
		 println "id = "+ params.id
		 
		 def u = springSecurityService.currentUser
		 Branch b = u.branch
		 b.refresh()
		  
		 Installation ins = Installation.get(params.id.toInteger())
		 
		 def details = [ 'appointmentNo':ins.appointment.appointmentNo,
			 'carNo':ins.appointment.customer.carCode,
			 'customerName':ins.appointment.customer.customerName,
			 'status':ins.status.name()]
		 
		 render details as JSON		 
 	}
	 
	@Transactional
 	def updateStatus(){
		 		
 		 println "id = "+ params.id
 		
		 
		 def u = springSecurityService.currentUser
		 Branch b = u.branch
		 b.refresh()
		  
		 
		 Installation ins = Installation.get(params.id.toInteger())
		 def istatus = ins.status
		 
		 println('status:'+istatus)
		 
		 if(istatus == InstallationStatus.NEW){
			println('Bestatus:'+ins.status)
		 	ins.checkprepareInstall()			 
			println('forstatus:'+ins.status)
			ins.save flush:true		
			 if (!ins.save()){
				 ins.errors.each{
					 println it
				 }
			 }		
		 }
		 
		 else if (istatus == InstallationStatus.PREPARE_INSTALL){
			 println('Bestatus:'+ins.status)
			 ins.checkreadyInstall()
			 println('forstatus:'+ins.status)
			 ins.save flush:true
			 if (!ins.save()){
				 ins.errors.each{
					 println it
				 }
			 }			 
		 }
		 
		 else if (istatus == InstallationStatus.READY_INSTALL){
			 println('Bestatus:'+ins.status)
			 ins.checkinstalling()
			 println('forstatus:'+ins.status)
			 ins.save flush:true
			 if (!ins.save()){
				 ins.errors.each{
					 println it
				 }
			 }
		 }
		 else if (istatus == InstallationStatus.INSTALLING){
			 println('Bestatus:'+ins.status)
			 ins.checkfinished()
			 println('forstatus:'+ins.status)
			 ins.save flush:true
			 if (!ins.save()){
				 ins.errors.each{
					 println it
				 }
			 }
		 }
	 
		 println "id = "+ params.nextStatus	
 	}
	 
	// Bird
	def installCalendar(){
		return
	}
	
	def getAllEvents(){
		
		println "getEvents"
		 
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
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
		
		// Get Installation
		def events = []
		def installation = Installation.withCriteria {
			or {
				eq("status",InstallationStatus.NEW)
				eq("status",InstallationStatus.READY_INSTALL)
				eq("status",InstallationStatus.INSTALLING)
				eq("status",InstallationStatus.PREPARE_INSTALL)
		   }
		   and {
			   order("startDate", "asc")
		   }
		}
  
	//	println('Installation:'+installation.size())
					 
		for(inst in installation){
		 	Installation ins = inst
			def jsonItem = [
				 'id': ins.id,
				 'title': ins.appointment.customer.carCode,
				 'start': dateTimeFormat.format(ins.startDate),
				 'end': dateTimeFormat.format(ins.endDate),
				 'allDay': false
				]
			 events.add(jsonItem)
			 println('Test Add jsonItem '+jsonItem)
		}
			 
		println('holidays '+ holidays)
		def js = ['maxtime':maxtime,'mintime':mintime,'events':events,'daysoff':daysoff,'holidays':holidays];
	 	 
		render js as JSON
	}
	
	
    def create() {
        respond new Installation(params)
    }

    @Transactional
    def save(Installation installationInstance) {
        if (installationInstance == null) {
            notFound()
            return
        }

        if (installationInstance.hasErrors()) {
            respond installationInstance.errors, view:'create'
            return
        }

        installationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'installationInstance.label', default: 'Installation'), installationInstance.id])
                redirect installationInstance
            }
            '*' { respond installationInstance, [status: CREATED] }
        }
    }

    def edit(Installation installationInstance) {
        respond installationInstance
    }

    @Transactional
    def update(Installation installationInstance) {
        if (installationInstance == null) {
            notFound()
            return
        }

        if (installationInstance.hasErrors()) {
            respond installationInstance.errors, view:'edit'
            return
        }

        installationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
                redirect installationInstance
            }
            '*'{ respond installationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Installation installationInstance) {

        if (installationInstance == null) {
            notFound()
            return
        }

        installationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'installationInstance.label', default: 'Installation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	// Aom
	@Transactional
	def prepareInstall(Installation installationInstance) {
		if (installationInstance == null) {
			notFound()
			return
		}

		if (installationInstance.hasErrors()) {
			respond installationInstance.errors, view:'edit'
			return
		}
		installationInstance.checkprepareInstall()

		installationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
				redirect installationInstance
			}
			'*'{ respond installationInstance, [status: OK] }
		}
	}
	
	@Transactional
	def intalling(Installation installationInstance) {
		if (installationInstance == null) {
			notFound()
			return
		}

		if (installationInstance.hasErrors()) {
			respond installationInstance.errors, view:'edit'
			return
		}
		installationInstance.checkinstalling()

		installationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
				redirect installationInstance
			}
			'*'{ respond installationInstance, [status: OK] }
		}
	}
	
	@Transactional
	def finished(Installation installationInstance) {
		if (installationInstance == null) {
			notFound()
			return
		}

		if (installationInstance.hasErrors()) {
			respond installationInstance.errors, view:'edit'
			return
		}
		installationInstance.checkfinished()

		installationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
				redirect installationInstance
			}
			'*'{ respond installationInstance, [status: OK] }
		}
	}
}
