package th.ac.chula.bsd.inventory

import th.ac.chula.bsd.wheel.Product;

class ReceivePurchaseLine {

	Product product
	int amount = 0
	
	static belongsTo = [
		receivePurchase: ReceivePurchase
		]
	
    static constraints = {
    }
	
	public void initialReceivePurchaseLine(ReceivePurchase recPurchase, Product prod, int amount){
		this.product = prod
		this.amount = amount
		this.receivePurchase = recPurchase
	}
}
