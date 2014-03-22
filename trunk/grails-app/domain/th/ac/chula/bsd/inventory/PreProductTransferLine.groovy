package th.ac.chula.bsd.inventory

import java.util.Date;

import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.wheel.Appointment;
import th.ac.chula.bsd.wheel.Branch;
import th.ac.chula.bsd.wheel.Product;
import th.ac.chula.bsd.wheel.ProductBranchTransfer;

class PreProductTransferLine {

	Product product
	int amount = 0
	Date createdDate = new Date()
	Date updatedDate = new Date()
	User createdBy
	User updatedBy
	
	PreProductTransferStatus status = PreProductTransferStatus.NEW
	
	static hasOne = [
		branch: Branch,
		appointment: Appointment
		]
	
	Set productTransferLines = []
	static hasMany = [
		productTransferLines: ProductTransferLine
		]
	
	static constraints = {
		product nullable:false
		amount blank:false
		createdDate blank:false
		updatedDate blank: false
	}
	
	public void initialPreProductTransfer(Appointment ap, Product prod, int amt){
		this.appointment = ap
		this.branch = ap.branch
		this.createdBy = ap.updatedBy
		this.updatedBy = ap.updatedBy
		this.product = prod
		this.amount = amt
	}
	
	public Branch getSuggestBranchTransfer(){
		def branchTran = ProductBranchTransfer.withCriteria {
			eq('branchTo.id', this.branch.id)
			eq('enable', true)
			and{
				order('transferDay', 'asc')
				order('transferHour', 'asc')
				order('transferMinute', 'asc')
			}
		}
		
		def result = null
		for(bt in branchTran){
			if(this.amount < this.product.getProductStock(bt.branchFrom)){
				result = bt.branchFrom
				break
			}
		}
		return result
	}
	
	public void cancel(User u){
		this.updateByUser(u)
		this.status = PreProductPurchaseStatus.CANCEL
	}
	
	public void addProductTransferLine(User u, Branch branchFrom, int transAmt){
		ProductTransferLine line = new ProductTransferLine()
		line.initProductTransferLine(u, this, branchFrom, transAmt)
		this.productTransferLines.add(line)
		this.status = PreProductTransferStatus.WAITING_FOR_TRANSFER
	}
	
	public void removeProductTransferLine(int pID){
		ProductTransferLine line = this.productTransferLines.find{it -> it.product.id == pID}
		this.productTransferLines.remove(line)
		this.checkProductTransferLine()
	}
	
	public void checkProductTransferLine(){
		if(this.productTransferLines.size() > 0){
			Boolean isComplete = true
			for(prodTran in this.productTransferLines){
				if(prodTran.status != ProductTransferStatus.RECEIVED){
					isComplete = false
					break
				}
			}
			if(isComplete){
				this.status = PreProductTransferStatus.COMPLETE
			}
		} else {
			this.status = PreProductTransferStatus.NEW
		}
	}
	
//====== Private Method ======
	private void updateByUser(User u){
		this.updatedBy = u
		this.updatedDate = new Date()
	}
}

enum PreProductTransferStatus{
	NEW,
	WAITING_FOR_TRANSFER,
	COMPLETE,
	CANCEL
}