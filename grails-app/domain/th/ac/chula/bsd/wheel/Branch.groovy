package th.ac.chula.bsd.wheel

import java.util.Date;
import java.util.regex.Pattern.Start;

import th.ac.chula.bsd.inventory.PreProductPurchaseLine;
import th.ac.chula.bsd.inventory.PreProductTransferLine;
import th.ac.chula.bsd.inventory.ProductPurchase;
import th.ac.chula.bsd.inventory.ProductTransferLine;
import th.ac.chula.bsd.inventory.ProductTransferStatus;
import th.ac.chula.bsd.security.User;

class Branch {
	
	String branchName
	String branchAddress
	
	int branchParkingAmount = 1
	int branchMachineAmount = 1
	int branchStartBreakHour = 12
	int branchStartBreakMinute = 0
	int branchEndBreakHour = 13
	int branchEndBreakMinute = 0
	int branchMaxLate = 30
	int branchMaxParking = 15
	int branchMaxPrepare = 5
	int branchMaxInstallation = 60
	//int branchTransportMinute
	//int branchTransportHour
	
	static hasMany = [
		workdays : WorkDay,
		appointments : Appointment,
		users: User,
		productBranchTransferFroms: ProductBranchTransfer,
		productBranchTransferTos: ProductBranchTransfer,
		productVendorTransfers: ProductVendorTransfer,
		installations: Installation,
		parkings: Parking,
		productStocks:ProductStock,
		preProductPurchaseLines: PreProductPurchaseLine,
		preProductTransferLines: PreProductTransferLine,
		productPurchases: ProductPurchase,
		productTransferLineFroms: ProductTransferLine,
		productTransferLineTos: ProductTransferLine
		]
	
	static mappedBy = [
		productBranchTransferFroms: 'branchFrom',
		productBranchTransferTos: 'branchTo',
		productTransferLineFroms: 'branchFrom',
		productTransferLineTos: 'branchTo'
		]
	/*
	static mapping = {
		workdays lazy: false
		appointments lazy: false
		productBranchs lazy: false
		productBranchTransferFroms lazy: false
		productBranchTransferTos lazy: false
		productVendorTransfers lazy: false
		installations lazy: false
		parkings lazy: false
	}
	*/
	static constraints = {
		branchName blank: false
		branchAddress blank: false
		branchParkingAmount blank: false
		branchStartBreakHour blank: false
		branchStartBreakMinute blank: false
		branchEndBreakHour blank: false
		branchEndBreakHour blank: false
		branchMaxLate blank: false
		//branchTransportMinute: false
		//branchTransportHour: false
	}
	
	public int calInstallTimeSpend() {
		return this.branchMaxPrepare + this.branchMaxInstallation
	}
	
	public int calTotalTimeSpend(){
		return this.calInstallTimeSpend() + this.branchMaxParking
	}
	
	public int calTotalTimeSpendIncludeWait(){
		return this.calTotalTimeSpend() + this.branchMaxLate
	}
	
	public Date getCloseTime(Date date) {
		Boolean isStop = false
		def closeTime = new GregorianCalendar()
		closeTime.setTime(date)
		
		while(!isStop){
			def wdlist = this.workdays.findAll{it.workDayCode.value == closeTime.get(Calendar.DAY_OF_WEEK) && it.workActive == true}
			if(wdlist.size() > 0){
				WorkDay wd = wdlist.find{it}
				closeTime.set(Calendar.HOUR_OF_DAY, wd.endHour)
				closeTime.set(Calendar.MINUTE, wd.endMinute)
				isStop = true
			} else {
				closeTime.add(Calendar.DATE, 1)
			}
		}
		
		return closeTime.getTime()
	}
	
	public Date getOpenTime(Date date) {
		Boolean isStop = false
		def openTime = new GregorianCalendar()
		openTime.setTime(date)
		
		while(!isStop){
			def wdlist = this.workdays.findAll{it.workDayCode.value == openTime.get(Calendar.DAY_OF_WEEK) && it.workActive == true}
			if(wdlist.size() > 0){
				WorkDay wd = wdlist.find{it}
				openTime.set(Calendar.HOUR_OF_DAY, wd.startHour)
				openTime.set(Calendar.MINUTE, wd.startMinute)
				isStop = true
			} else {
				openTime.add(Calendar.DATE, 1)
			}
		}
		
		return openTime.getTime()
	}
	
	public Date getStartBreakTime(Date date){
		def sBreak = new GregorianCalendar()
		sBreak.setTime(date)
		sBreak.set(Calendar.HOUR_OF_DAY, this.branchStartBreakHour)
		sBreak.set(Calendar.MINUTE, this.branchStartBreakMinute)
		
		return sBreak.getTime()
	}
	
	public Date getEndBreakTime(Date date){
		def eBreak = new GregorianCalendar()
		eBreak.setTime(date)
		eBreak.set(Calendar.HOUR_OF_DAY, this.branchEndBreakHour)
		eBreak.set(Calendar.MINUTE, this.branchEndBreakMinute)
		
		return eBreak.getTime()
	}
	
	public int calBreakMinute(){
		int diffHour = this.branchEndBreakHour - this.branchStartBreakHour
		int diffMin = (this.branchEndBreakMinute - this.branchStartBreakMinute).abs()
		return (diffHour * 60) + diffMin
	}
	
	public int getMaxQueue(){
		int maxQ = this.branchMachineAmount
		if(maxQ > this.branchParkingAmount){
			maxQ = this.branchParkingAmount
		}
		return maxQ
	}
	
	public Boolean checkHoliday(Date checkHoliday){
		Boolean result = false
		def lholidays = Holiday.withCriteria {
			eq('holidayDate', checkHoliday)
		}
		if(lholidays.size() > 0){
			result = true
		}
		return result
	}

	public Object getAllHoliday(Date today){
		def start = new GregorianCalendar()
		start.setTime(today)
		start.clearTime()
		start.set(Calendar.DATE, 1)
		//start.set(Calendar.MONTH, month)
		//start.set(Calendar.YEAR, year)
		start.setTime(start.getTime().clearTime())
		
		def end = new GregorianCalendar()
		end.setTime(start.getTime())
		end.add(Calendar.YEAR, 1)
		int lastdate = end.getActualMaximum(Calendar.DATE)
		end.set(Calendar.DATE, lastdate)

		// Get Holiday
		def lholidays = Holiday.withCriteria {
			between('holidayDate', start.getTime(), end.getTime())
		}
		return lholidays
	}
	
	public Object getAllHolidayAndCloseDay(int month, int year){
		def start = new GregorianCalendar()
		start.set(Calendar.DATE, 1)
		start.set(Calendar.MONTH, month)
		start.set(Calendar.YEAR, year)
		start.setTime(start.getTime().clearTime())
		
		def end = new GregorianCalendar()
		end.setTime(start.getTime())
		int lastdate = start.getActualMaximum(Calendar.DATE)
		end.set(Calendar.DATE, lastdate)

		// Get Holiday
		def lholidays = Holiday.withCriteria {
			between('holidayDate', start.getTime(), end.getTime())
		}
		
		def closeDate = new GregorianCalendar()
		closeDate.setTime(start.getTime())
		// Get 
		for(i in 1..lastdate){
			closeDate.set(Calendar.DATE, i)
			def wdlist = this.workdays.findAll{it.workDayCode.value == closeDate.get(Calendar.DAY_OF_WEEK) && it.workActive == true}
			if(wdlist.size() == 0){
				Holiday holiday = new Holiday()
				holiday.holidayDate = closeDate.getTime()
				holiday.holidayName = 'Close'
				lholidays.add(holiday)
			}
		}
		return lholidays		
	}
	
	public Object getAllAppointmentInMonth(Date today){
		def start = new GregorianCalendar()
		start.setTime(today)
		start.clearTime()
		start.set(Calendar.DATE, 1)
		//start.set(Calendar.MONTH, month)
		//start.set(Calendar.YEAR, year)
		
		def end = new GregorianCalendar()
		end.setTime(start.getTime())
		end.add(Calendar.YEAR, 1)
		int lastdate = start.getActualMaximum(Calendar.DATE)
		end.set(Calendar.DATE, lastdate)

		Date sDate = start.getTime()
		Date eDate = end.getTime()
		def lAppoints = Appointment.withCriteria {
			and {
				between('startDate', sDate, eDate)
				//le('endDate', end.getTime())
				//between('startDate', start.getTime(), end.getTime())
				//between('endDate', start.getTime(), end.getTime())
				eq('branch.id', this.id)
			}
		}
		return lAppoints
	}
	
	public Object getBestTransfer(int amount, Product product) {
		Object result = null
		Boolean isPurchase = false
		
		// find branch that can transfer and has enough stock
		def listBranchTransfer = ProductBranchTransfer.withCriteria {
			or {
				eq('branchFrom.id', this.id)
				//eq('branchTo.id', this.id)
			}
			and {
				order("transferDay", "desc")
				order("transferHour", "desc")
				order("transferMinute", "desc")
			}
		}
		
		if (listBranchTransfer.size() > 0){
			for(pb in listBranchTransfer){
				Branch bTrans = null
				if(pb.branchFrom.id == this.id) bTrans = Branch.get(pb.branchTo.id)
				else bTrans = Branch.get(pb.branchFrom.id)
				def productB = bTrans.productStocks.findAll{
					it.product.id == product.id && it.stock >= amount
				}
				if(productB.size() > 0){
					result = pb
					break
				}
			}
			if(!result) {
				isPurchase = true
			}
		} else {
			isPurchase = true
		}
		
		if(isPurchase){  // check vendor
			def listProdVendor = ProductVendorTransfer.withCriteria{
				and {
					eq("product.id", product.id)
					eq("branch.id", this.id)
				}
				and {
					order("transferDay", "desc")
					order("transferHour", "desc")
					order("transferMinute", "desc")
				}
			}
			if (listProdVendor.size() > 0) {
				result = listProdVendor[0]
			}
		}
		
		/*
		def branch = Branch.get(this.id)
		Object result = null
		// check branch
		def listProdBranch = branch.productBranchTransfers.withCriteria{
			ge("stock", amount)
			order("transferDay, transferHour, transferMinute", "desc")
		}
		
		if (listProdBranch.size() > 0) {
			result = listProdBranch[0]
		} else { // check Vendor
			def listProdVendor = branch.productVendorTransfers.withCriteria{
				order("transferDay, transferHour, transferMinute", "desc")
			}
			if (listProdVendor.size() > 0) {
				result = listProdVendor[0]
			}
		}
		*/
		return result
		
	}

// Inventory =============================
	public ProductStock getProductStock(Product prod){
		return this.productStocks.find {it -> it.product.id == prod.id}
	}
	
	public void increaseProductStock(Product prod, int amount){
		ProductStock stock = this.getProductStock(prod)
		stock.increaseStock(amount)
	}
	
	public void decreaseProductStock(Product prod, int amount){
		ProductStock stock = this.getProductStock(prod)
		stock.decreaseStock(amount)
	}
	
	public Object getPrePurchaseWithVendor(int vendorID){
		Vendor vendor = Vendor.get(vendorID)
		def prodList = []
		for(prodVendor in vendor.productVendors){
			ProductVendorTransfer pv = prodVendor
			prodList.add(pv.product.id)
		}
		
		def lPrePurchase = this.preProductPurchaseLines.find{it -> prodList.contains(it.product.id)}
		return lPrePurchase
	}
	
	public Object getTransferFromOtherBranch(){
		def tranLists = this.productTransferLineTos.findAll{it -> it.status == ProductTransferStatus.NEW || it.status == ProductTransferStatus.REJECTED}
		return tranLists
	}
	
	public Object getTransferOfBranch(){
		def tranLists = this.productTransferLineFroms.findAll{it -> it.status == ProductTransferStatus.NEW || it.status == ProductTransferStatus.REJECTED || it.status == ProductTransferStatus.TRANSFERED}
		return tranLists
	}
}
