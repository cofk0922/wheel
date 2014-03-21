package th.ac.chula.bsd.wheel

import java.util.Date;

import th.ac.chula.bsd.security.User;

class RequisitionLine {

	Product product
	Branch branch
	int amount = 0
	Date createdDate = new Date()
	Date updatedDate = new Date()
	User createdBy
	User updatedBy
	
	RequisitionLineStatus status = RequisitionLineStatus.NEW
	
	static hasOne = [
		installation:Installation
		]
	
	static constraints = {
		product nullable:false
		createdDate blank:false
		updatedDate blank: false
	}
	
	public void initialRequisition(Installation install, Product prod, int amt){
		this.installation = install
		this.branch = install.branch
		this.createdBy = install.updatedBy
		this.updatedBy = install.updatedBy
		this.product = prod
		this.amount = amt
	}
	
	public void newRequisit(){
		this.status = RequisitionLineStatus.NEW 
	}
	
	public void readyRequisit(){
		this.status = RequisitionLineStatus.READY_REQUISIT
		branch.decreaseProductStock(product,amount)
	  
	}
	 
 	public Boolean checkProductStock(){
		Boolean result = false
		def prod = product.getProductStock(branch)	 
		if(prod > amount){
		   result = true
		}	 
		return result
	}
	
	public void requisited(){
		this.status = RequisitionLineStatus.REQUISITED
	}
	
	public void cancelRequisit(){
		this.status = RequisitionLineStatus.CANCEL
	}
}

enum RequisitionLineStatus {
	NEW,
	READY_REQUISIT,
	REQUISITED,
	CANCEL
}