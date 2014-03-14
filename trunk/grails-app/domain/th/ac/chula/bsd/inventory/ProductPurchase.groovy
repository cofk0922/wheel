package th.ac.chula.bsd.inventory

import java.util.Date;

import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.wheel.Branch;
import th.ac.chula.bsd.wheel.Product;
import th.ac.chula.bsd.wheel.ProductVendorTransfer;
import th.ac.chula.bsd.wheel.Vendor;

class ProductPurchase {

	String purchaseID
	Date purchaseDate = new Date()
	Date arrivalDate = new Date()
	Vendor vendor
	Double totalPrice = 0.0
	Double vat = 0.07 // eg. Vat 7% = 0.07
	
	PurchasePaymentType paymentType
	ProductPurchaseStatus status = ProductPurchaseStatus.NEW
	
	Date createdDate = new Date()
	Date updatedDate = new Date()
	
	User createdBy
	User updatedBy
	
	static hasOne = [
		branch: Branch
		]
	
	Set purchaseLines = []
	Set receivePurchases = []
	static hasMany = [
		purchaseLines: ProductPurchaseLine,
		receivePurchases: ReceivePurchase
		]
	
    static constraints = {
		createdDate blank:false
		updatedDate blank: false
    }
	
	public void initialProductPurchase(Branch b, User user, String purchaseID, PurchasePaymentType paymentType, Vendor vendor){
		this.branch = b
		this.createdBy = user
		this.updatedBy = user
		this.purchaseID = purchaseID
		this.paymentType = paymentType
		this.vendor = vendor
	}
	
	public void addProductPurchaseLine(User u, Product prod, int amount, Double unitPrice){
		this.updateByUser(u)
		
		def lines = this.purchaseLines.findAll{it -> it.product.id == prod.id}
		if(lines.size() > 0){
			def line = lines.find{it}
			line.amount += amount
		} else {
			def venTrans = ProductVendorTransfer.withCriteria {
				and{
					eq("vendor.id", this.vendor.id)
					eq("product.id", prod.id)
				}
			}
			ProductVendorTransfer venT = venTrans.find {it}
			ProductPurchaseLine line = new ProductPurchaseLine()
			line.initProductPurchaseLine(this, prod, amount, venT.unitPrice)
			this.purchaseLines.add(line)
		}
		this.calNetTotal()
	}
	
	public void removeProductPurchaseLine(User u, int pID){
		this.updateByUser(u)
		def lines = this.purchaseLines.findAll{it -> it.product.id == pID}
		if(lines.size() > 0){
			def line = lines.find{it}
			this.purchaseLines.remove(line)
		}
		this.calNetTotal()
	}
	
	public Double calTotal(){
		Double result = 0.0
		for(pline in this.purchaseLines){
			ProductPurchaseLine line = pline
			result += line.calTotal() //line.calNetTotal()
		}
		return result
	}
	
	/*
	public Double calDiscountTotal(){
		Double result = 0.0
		for(line in this.purchaseLines){
			result += line.calDiscount()
		}
		return result
	}
	*/
	
	public Double calVat(){
		Double total = this.calTotal()
		return total * this.vat
	}
	
	public void calNetTotal(){
		this.totalPrice = this.calTotal() + this.calVat()
	}
	
	public Boolean confirmPurchasing(){
		Boolean isSuccess = false
		if(this.status == ProductPurchaseStatus.NEW){
			this.calNetTotal()
			this.status = ProductPurchaseStatus.PURCHASING
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean cancelPurchasing(){
		Boolean isSuccess = false
		if(this.status == ProductPurchaseStatus.NEW){
			this.calNetTotal()
			this.status = ProductPurchaseStatus.CANCEL
			isSuccess = true
		}
		return isSuccess
	}
	
// Method when receive 	
	public void receivePurchase(ReceivePurchase rec, User u){
		this.updateByUser(u)
		this.receivePurchases.add(rec)
		this.checkReceivePurchaseStatus()
		//this.status = ProductPurchaseStatus.WAITING_RECEIVE
	}
	
	public void checkReceivePurchaseStatus(){
		Boolean isReceiveAll = true
		for(line in this.purchaseLines){
			if(line.calRemainProduct() > 0){
				isReceiveAll = false
				break
			}
		}
		if(isReceiveAll){
			this.status = ProductPurchaseStatus.COMPLETE
		} else {
			this.status = ProductPurchaseStatus.WAITING_RECEIVE
		}
	}
	
	//====== Private Method ======
	private void updateByUser(User u){
		this.updatedBy = u
		this.updatedDate = new Date()
	}
}

enum ProductPurchaseStatus{
	NEW,
	PURCHASING,
	WAITING_RECEIVE,
	COMPLETE,
	CANCEL
}
