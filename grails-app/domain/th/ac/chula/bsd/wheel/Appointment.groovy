package th.ac.chula.bsd.wheel

import java.util.Date;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import th.ac.chula.bsd.inventory.PreProductPurchaseLine;
import th.ac.chula.bsd.inventory.PreProductTransferLine;
import th.ac.chula.bsd.security.User;

class Appointment {
	Date createdDate = new Date()
	Date updatedDate = new Date()
	Date startDate = new Date()
	Date endDate = new Date()
	Date endAppointmentDate = new Date()
	Double installTotal = 0.0
	AppointmentStatus status = AppointmentStatus.NEW
	
	User createdBy
	User updatedBy
	
	static belongsTo = [branch: Branch]
	
	static hasOne = [
		parking: Parking,
		installation: Installation
		]
	
	Set subOrders = []
	Set preProductTransfer = []
	Set preProductPurchase = []
	static hasMany = [
		subOrders: AppointmentOrderList,
		preProductTransfer: PreProductTransferLine,
		preProductPurchase: PreProductPurchaseLine
		]
	
	Customer customer
	static embedded = ['customer']
	
	static constraints = {
		createdDate blank:false
		updatedDate blank: false
		startDate blank: false
		endDate blank: false
		endAppointmentDate blank:false 
		installTotal blank: false
		status nullable: false
	}
	
	public void initialAppointment(User u, Branch b){
		this.branch = b
		this.createdBy = u
		this.updatedBy = u
	}
	
	public void addProduct(User u, int pID, int amount) {
		this.updateByUser(u)
		def order = new AppointmentOrderList(appointment:this, branch: this.branch)
		order.setProductWithAmount(pID, amount, this.branch)
		def o = order
		this.subOrders.add(order)
		/*		
		if(order.product.productType == ProductType.WHEEL){
			int knotTotalAmt = order.product.calPartUsage(amount)
			def orderKnot = new AppointmentOrderList(appointment:this)
			orderKnot.setProductWithAmount(order.product.productPart.id, knotTotalAmt, this.branch)
			this.subOrders.add(orderKnot)
		}*/
		this.calNetTotal()
		this.calStartEndAppointment()
	}
	
	public void removeProduct(User u, int pID) {
		this.updateByUser(u)
		def order = this.subOrders.find{it.product.id == pID}
		/*
		if(order.product.productType == ProductType.WHEEL) {
			def orderKnot = this.subOrders.find{it.product.id == order.product.productPart.id}
			this.subOrders.remove(orderKnot)
		}*/
		this.subOrders.remove(order)
		this.calNetTotal()
		this.calStartEndAppointment()
	}
	
	public void setNewCustomer(String custName, String custTel, String custAdd, String custCar){
		this.customer = new Customer(customerName:custName, customerTel:custTel, customerAddress:custAdd, carCode:custCar)
	}
	
	public void confirmAppointment(Boolean isInstallNow){
		// Park
		if(!this.parking){
			this.parking = new Parking()
			this.parking.initialParking(this)
		}
		if(isInstallNow){
			this.parking.startDate = new Date()
		} else {
			this.parking.startDate = this.startDate
		}
		this.parking.endDate = this.endDate
		
		// Install
		if(!this.installation){
			this.installation = new Installation()
			this.installation.initialInstall(this)
		}
		def calendar = new GregorianCalendar()
		calendar.setTime(this.startDate)
		calendar.add(Calendar.MINUTE, this.branch.branchMaxLate)
		this.installation.startDate = calendar.getTime()
		calendar.add(Calendar.MINUTE, this.branch.calInstallTimeSpend())
		this.installation.endDate = calendar.getTime()
		this.endAppointmentDate = new Date(this.installation.endDate.getTime())
		for(o in this.subOrders){
			if(o.product.productType == ProductType.WHEEL || o.product.productType == ProductType.KNOT){
				this.installation.addRequisition(o.product, o.amount)
			}
		}
		
		//Brunch Transfer and Purchase
		for(o in this.subOrders){
			if (o.isTransfer) {
				PreProductTransferLine transfer = new PreProductTransferLine()
				transfer.initialPreProductTransfer(this, o.product, o.amount)
				this.preProductTransfer.add(transfer)
			}
			
			if (o.isPurchase){
				PreProductPurchaseLine purchase = new PreProductPurchaseLine()
				purchase.initialPreProductPurchase(this, o.product, o.amount)
				this.preProductPurchase.add(purchase)
			}
		}
	}
	
	public Double calChange(Double money){
		return money - installTotal
	}
	
	public void beginInstall(){
		this.status = AppointmentStatus.INPROCESS
		this.installation.prepareInstall()
	}
	
	public void cancelAppointment(){
		this.status = AppointmentStatus.CANCEL
		this.installation.cancelInstall()
		this.parking.cancelPark()
	}
	
	public void changeAppointmentDate(Date newStartDate, Date newEndDate, Boolean isInstallNow){
		this.startDate = newStartDate
		this.endDate = newEndDate
		this.confirmAppointment(isInstallNow)
	}
	
	public Boolean checkReturnCar(){
		Boolean result = false
		if((this.installation.status == InstallationStatus.FINISHED) && (this.parking.status != ParkingStatus.UNRESERVE)){
			this.parking.returnCar()
			this.status = AppointmentStatus.CAR_RETURNED
			result = true
		}
		return result
	}
	
//====== Private Method ======
	private void updateByUser(User u){
		this.updatedBy = u
		this.updatedDate = new Date()
	}
	
	private AppointmentOrderList findOrderByProductID(int pID){
		return this.subOrders.findAllByProduct(Product.get(pID))
		//return AppointmentOrderList.find("from AppointmentOrderList as ord where ord.appointment=:app and ord.product=:prod",[app:this, prod:Product.get(pID)])
	}
	
	private void calNetTotal() {
		this.installTotal = 0.0
		for ( order in this.subOrders){
			this.installTotal += order.calTotal()
		}
	}
	
	private void calStartEndAppointment(){
		// cal Fastest Start End
		Date today = new Date() //
		Date startDate = today
		Date endDate = today
		Date installStartDate = today
		Date installEndDate = today
		
		for(or in this.subOrders){
			Date newStartDate = or.getStartInstallationDate(today, this.branch)
			//println 'new Start Date : '+ newStartDate
			if(newStartDate > startDate){
				startDate = newStartDate
			}
			//println 'Start Date : '+startDate
		}
		
		Boolean isStop = false
		while(!isStop){
			// Check Holiday
			def checkHoliday = new Date(startDate.getTime());
			checkHoliday.set(second:0, minute:0, hourOfDay:0)
			if(this.branch.checkHoliday(checkHoliday)){
				startDate = this.branch.getOpenTime(new Date(startDate.getTime() + TimeUnit.DAYS.toMillis(1)))
				continue
			}
			
			// Check WorkDate
			def checkWork = new GregorianCalendar()
			checkWork.setTime(startDate)
			def lWorkdays = this.branch.workdays.findAll{it.workDayCode.value == checkWork.get(Calendar.DAY_OF_WEEK) && it.workActive == true}
			if(lWorkdays.size() <= 0){
				startDate = this.branch.getOpenTime(new Date(startDate.getTime() + TimeUnit.DAYS.toMillis(1)))
				continue
			}
			
			// Check Open Lunch and Close Time
			Boolean isInstallNow = true
			if(startDate == today){
				Date calDateEnd = new Date(startDate.getTime() + TimeUnit.MINUTES.toMillis(this.branch.calTotalTimeSpend()))
				if (calDateEnd > this.branch.getCloseTime(startDate)){
					isInstallNow = false
				}
			} else {
				isInstallNow = false
			}
			
			if(isInstallNow){
				installStartDate = startDate
				installEndDate = new Date(installStartDate.getTime() + TimeUnit.MINUTES.toMillis(this.branch.calTotalTimeSpend()))
			} else {
				installStartDate = new Date(startDate.getTime() + TimeUnit.MINUTES.toMillis(this.branch.branchMaxLate))
				installEndDate = new Date(installStartDate.getTime() + TimeUnit.MINUTES.toMillis(this.branch.calTotalTimeSpend()))
			}
			
			// Check Lunch
			Date startBreak = this.branch.getStartBreakTime(installStartDate)
			Date endBreak = this.branch.getEndBreakTime(installStartDate)
			if(installStartDate < startBreak && (installEndDate > startBreak && installEndDate < endBreak )){
				installEndDate = new Date(installEndDate.getTime() + TimeUnit.MINUTES.toMillis(this.branch.calBreakMinute()))
			} else if (installEndDate > endBreak && (installStartDate > startBreak && installStartDate < endBreak)){
				installStartDate = this.branch.getEndBreakTime(installStartDate)
				startDate = new Date(installStartDate.getTime() - TimeUnit.MINUTES.toMillis(this.branch.branchMaxLate))
				installEndDate = new Date(installStartDate.getTime() + TimeUnit.MINUTES.toMillis(this.branch.calTotalTimeSpend()))
			}
			endDate = installEndDate
			
			// Check Open Time
			if(startDate < this.branch.getOpenTime(startDate)){
				startDate = this.branch.getOpenTime(new Date(startDate.getTime()))
				continue
			}
			
			// Check Close Time
			if(endDate > this.branch.getCloseTime(endDate)){
				startDate = this.branch.getOpenTime(new Date(startDate.getTime() + TimeUnit.DAYS.toMillis(1)))
				continue
			}
			
			// Check Available Time
			int maxQueue = this.branch.getMaxQueue()
			def listPark = Parking.withCriteria {
				and {
					eq("branch.id", this.branch.id)
					
					gt("endDate", startDate)
					lt("startDate", endDate)

					eq("status", ParkingStatus.RESERVE)
				}
				and {
					order("startDate", "asc")
					order("endDate", "asc")
				}
			}
			if (listPark.size() >= maxQueue) {
				startDate = listPark[0].endDate
				continue
			}
			
			isStop = true
		}
		
		this.startDate = startDate
		this.endDate = endDate
		if(!this.installation){
			this.installation = new Installation()
			this.installation.initialInstall(this)
		}
		this.installation.startDate = installStartDate
		this.installation.endDate = installEndDate
	}
}

class Customer {
	String customerName
	String customerTel
	String customerAddress
	String carCode
}

enum AppointmentStatus {
	NEW,
	INPROCESS,
	INSTALL_FINISED,
	CAR_RETURNED,
	IDEL,
	CANCEL
}
