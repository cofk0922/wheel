package th.ac.chula.bsd.wheel

class ProductStock {
	int stock = 0
	
	Double unitPrice = 0.0
	
	static hasOne = [
		branch: Branch,
		product: Product,
	]
    static constraints = {
    }
	
	public void increaseStock(int amount){
		this.stock += amount
	}
	
	public void decreaseStock(int amount){
		this.stock -= amount
	}
}
