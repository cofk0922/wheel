package th.ac.chula.bsd.inventory

import java.util.Date;

import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.wheel.Branch;
import th.ac.chula.bsd.wheel.Product;
import th.ac.chula.bsd.wheel.ProductStock;
import th.ac.chula.bsd.wheel.RequisitionLine;

class ProductTransferLine {

	Product product
	int amount
	Date createdDate = new Date()
	Date updatedDate = new Date()
	User createdBy
	User updatedBy
	
	ProductTransferStatus status = ProductTransferStatus.NEW
	
	Branch branchFrom
	Branch branchTo
	
	static belongsTo = [
		preTransferLine: PreProductTransferLine,
		branchFrom: Branch
		]
	
    static constraints = {
		product blank:false
		amount blank:false
		createdDate blank:false
		updatedDate blank: false
    }
	
	public void initProductTransferLine(User u, PreProductTransferLine preLine, Branch branchTo, int amount){
		this.createdBy = u
		this.updatedBy = u
		this.preTransferLine = preLine
		this.branchFrom = preTransferLine.branch
		this.branchTo = branchTo
		this.product = preLine.product
		this.amount = amount
	}
	
	public Boolean beginTransferProduct(User u){
		Boolean isSuccess = false
		if(this.status == ProductTransferStatus.NEW && u.branch.id == this.branchTo.id){
			this.updateByUser(u)
			this.status = ProductTransferStatus.TRANSFERED
			
			// decrease stock branchTo
			this.branchTo.decreaseProductStock(this.product, amount)
			
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean receiveTransfer(User u){
		Boolean isSuccess = false
		if(this.status == ProductTransferStatus.TRANSFERED && u.branch.id == this.branchFrom.id){
			this.updateByUser(u)
			this.status = ProductTransferStatus.RECEIVED
			
			// increase stock branchFrom
			this.branchFrom.increaseProductStock(this.product, this.amount)
			
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean rejectTransfer(User u){
		Boolean isSuccess = false
		if(this.status == ProductTransferStatus.NEW && u.branch.id == this.branchTo.id){
			this.updateByUser(u)
			this.status = ProductTransferStatus.REJECTED
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean cancelTransfer(User u){
		Boolean isSuccess = false
		if((this.status == ProductTransferStatus.NEW || this.status == ProductTransferStatus.REJECTED) && (u.branch.id == this.branchFrom.id)){
			this.updateByUser(u)
			this.status = ProductTransferStatus.CANCEL
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

enum ProductTransferStatus{
	NEW,
	TRANSFERED,
	RECEIVED,
	REJECTED,
	CANCEL
}
