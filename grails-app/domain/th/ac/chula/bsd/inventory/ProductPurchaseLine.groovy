package th.ac.chula.bsd.inventory

import th.ac.chula.bsd.wheel.Product;
import th.ac.chula.bsd.wheel.ProductStock;

class ProductPurchaseLine {

	Product product
	int amount = 0
	Double unitPrice = 0.0
	//Double discount = 0.0 // ex. Discount 10% = 0.1
	
	//ProductPurchaseLineStatus status = ProductPurchaseLineStatus.WAITING
	
	static belongsTo = [
		productPurchase: ProductPurchase
		]
	
    static constraints = {
		product blank:false
		amount blank:false
		unitPrice blank:false
    }
	
	public void initProductPurchaseLine(ProductPurchase purchase, Product prod, int amount, Double unitP){
		this.product = prod
		this.amount = amount
		this.unitPrice = unitP
		this.productPurchase = purchase
	}
	
	public Double calTotal(){
		return this.amount * this.unitPrice
	}
	
	/*
	public Double calDiscount(){
		return this.calTotal() * this.discount
	}
	
	
	public Double calNetTotal(){
		return this.calTotal() - this.calDiscount()
	}
	*/
	/*
	public Boolean receiving(){
		Boolean isSuccess = false
		if(this.status == ProductPurchaseLineStatus.WAITING){
			this.status = ProductPurchaseLineStatus.RECEIVING
			isSuccess = true
		}
		return isSuccess
	}
	
	public Boolean received(){
		Boolean isSuccess = false
		if(this.status == ProductPurchaseLineStatus.RECEIVING){
			this.status = ProductPurchaseLineStatus.RECEIVED
			isSuccess = true
		}
		return isSuccess
	}
	*/
	
// Method when receive
	public int calRemainProduct(){
		int receiveAmt = 0
		for(recHeader in this.productPurchase.receivePurchases){
			ReceivePurchase rec = recHeader
			def recLines = rec.receivePurchaseLines.findAll{it -> it.product.id == this.product.id}
			for(item in recLines){
				receiveAmt += item.amount
			} 
		}
		return this.amount - receiveAmt
	}
}

/*
enum ProductPurchaseLineStatus{
	WAITING, RECEIVING, RECEIVED
}
*/
