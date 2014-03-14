package th.ac.chula.bsd.inventory

import java.util.Date;

import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.wheel.Appointment;
import th.ac.chula.bsd.wheel.Branch;
import th.ac.chula.bsd.wheel.Product;

class PreProductPurchaseLine {

	Product product
	
	int amount = 0
	Date createdDate = new Date()
	Date updatedDate = new Date()
	User createdBy
	User updatedBy
	
	PreProductPurchaseStatus status = PreProductPurchaseStatus.NEW
	
	static hasOne = [
		branch: Branch,
		appointment: Appointment
		]
	
	static constraints = {
		product nullable:false
		createdDate blank:false
		updatedDate blank: false
	}
	
	public void initialPreProductPurchase(Appointment ap, Product prod, int amt){
		this.appointment = ap
		this.branch = ap.branch
		this.createdBy = ap.updatedBy
		this.updatedBy = ap.updatedBy
		this.product = prod
		this.amount = amt
	}
	
	public Boolean cancel(User u){
		Boolean isSuccess = false
		if(this.status == PreProductPurchaseStatus.NEW){
			this.updateByUser(u)
			this.status = PreProductPurchaseStatus.CANCEL
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean purchasing(User u){
		Boolean isSuccess = false
		if(this.status == PreProductPurchaseStatus.NEW){
			this.updateByUser(u)
			this.status = PreProductPurchaseStatus.PURCHASING
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean complete(User u){
		Boolean isSuccess = false
		if(this.status == PreProductPurchaseStatus.PURCHASING){
			this.updateByUser(u)
			this.status = PreProductPurchaseStatus.COMPLETE
			isSuccess = true
		}
		return isSuccess
	}
	
//====== Private Method ======
	private void updateByUser(User u){
		this.updatedBy = u
		this.updatedDate = new Date()
	}
}

enum PreProductPurchaseStatus{
	NEW,
	PURCHASING,
	COMPLETE,
	CANCEL
}
