package th.ac.chula.bsd.inventory

import java.util.Date;

import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.wheel.Branch;
import th.ac.chula.bsd.wheel.Product;
import th.ac.chula.bsd.wheel.ProductStock;

class ReceivePurchase {

	String receiveID
	Date createdDate = new Date()
	User createdBy

	Branch branch
	
	static belongsTo = [
		productPurchase: ProductPurchase
		]
	
	Set receivePurchaseLines = []
	static hasMany = [
		receivePurchaseLines: ReceivePurchaseLine
		]
	
    static constraints = {
		createdDate blank:false
    }
	
	public void initialReceivePurchase(ProductPurchase purchase, User u, String recID){
		this.productPurchase = purchase
		this.branch = purchase.branch
		this.createdBy = u
		this.receiveID = recID
	}
	
	public void addReceivePurchaseLine(Product prod, int amount){
		ReceivePurchaseLine line = new ReceivePurchaseLine()
		line.initialReceivePurchaseLine(this, prod, amount)
		this.receivePurchaseLines.add(line)
		
		ProductStock stock = this.branch.getProductStock(prod)
		stock.increaseStock(amount)
	}
	
	public void removeReceivePurchaseLine(int pID){
		def lines = this.receivePurchaseLines.findAll{it -> it.product.id == pID}
		int removeAmt = 0
		if(lines.size() > 0){
			def line = lines.find{it}
			removeAmt = line.amount
			this.receivePurchaseLines.remove(line)
		}
		ProductStock stock = this.branch.getProductStock(prod)
		stock.decreaseStock(removeAmt)
	}
}
