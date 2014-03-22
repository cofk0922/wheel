package th.ac.chula.bsd.wheel

import java.util.Date;

class AppointmentOrderList {
	int amount = 0
	Double unitPrice = 0.0
	
	Product product
	Branch branch
	
	static belongsTo = [appointment : Appointment]
	
	Boolean isTransfer = false
	Boolean isPurchase = false
	
	static constraints = {
		amount blank: false
		unitPrice blank:false
		product nullable:false
	}
	
	public void setProductWithAmount(long pID, int amount, Branch b) {
		def prod = Product.get(pID)
		this.product = prod
		this.amount = amount
		this.unitPrice = prod.getProductUnitPrice(b)
	}
	
	public Double calTotal() {
		return this.amount * this.unitPrice
	}
	
	public Date getStartInstallationDate(Date startDate, Branch b){
		def calendar = new GregorianCalendar()
		calendar.setTime(startDate)
		println 'stock: '+ this.product.getProductStock(b)
		if(this.amount > this.product.getProductStock(b)) {
			def tranP = b.getBestTransfer(this.amount, this.product)
			
			if (tranP instanceof ProductBranchTransfer){
				ProductBranchTransfer pbt = (ProductBranchTransfer) tranP
				this.isTransfer = true
				
				if(pbt.transferDay > 0){
					calendar.setTime(b.getOpenTime(startDate))
					calendar.add(Calendar.DATE, 1)
				}
				
				calendar.add(Calendar.DATE, pbt.transferDay)
				calendar.add(Calendar.HOUR_OF_DAY, pbt.transferHour)
				calendar.add(Calendar.MINUTE, pbt.transferMinute)
			} else if (tranP instanceof ProductVendorTransfer){
				ProductVendorTransfer pvt = (ProductVendorTransfer) tranP
				this.isPurchase = true
				
				if(pvt.transferDay > 0){
					calendar.setTime(b.getOpenTime(startDate))
					calendar.add(Calendar.DATE, 1)
				}
				calendar.add(Calendar.DATE, pvt.transferDay)
				calendar.add(Calendar.HOUR_OF_DAY, pvt.transferHour)
				calendar.add(Calendar.MINUTE, pvt.transferMinute)
			}
		}
		
		return calendar.getTime()
	}
}
