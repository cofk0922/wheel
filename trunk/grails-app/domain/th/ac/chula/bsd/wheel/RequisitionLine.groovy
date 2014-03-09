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
}

enum RequisitionLineStatus {
	NEW,
	READY_REQUISIT,
	REQUISITED,
	CANCEL
}