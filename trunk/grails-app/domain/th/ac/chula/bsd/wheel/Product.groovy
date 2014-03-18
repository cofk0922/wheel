package th.ac.chula.bsd.wheel

class Product {
	String prodName
	String prodDesc
	
	Product productPart
	int productPartAmount
	ProductType productType
	
	Set productStocks = []
	Set productVendorTransfers = []
	static hasMany = [
			productStocks: ProductStock,
			productVendorTransfers: ProductVendorTransfer
		]
	
	static constraints = {
		prodName blank: false
		prodDesc nullable: true
		productPart nullable: true
		productPartAmount nullable: true
	}
	
	public void initialProductWithBranch(String prodName, String prodDesc, Branch b){
		this.prodName = prodName
		this.prodDesc = prodDesc
		
		// initial stock
		ProductStock stock = new ProductStock()
		stock.initialProductStock(b, this)
		this.productStocks.add(stock)
	}
	
	public int getProductStock(Branch b) {
		Product prod = Product.get(this.id)
		def prodStock = prod.productStocks.find{it.branch.id == b.id}
		return prodStock.stock
	}
	
	public int calPartUsage(int amount) {
		Product prod = Product.get(this.id)
		int partUsage = 0
		if(prod.productPart != null){
			partUsage = prod.productPartAmount * amount
		}
		return partUsage
	}
	
	public Double getProductUnitPrice(Branch b){
		Product prod = Product.get(this.id)
		def prodStock = prod.productStocks.find{it.branch.id == b.id}
		return prodStock.unitPrice
	}
}

enum ProductType {
	INSTALLATION,
	WHEEL,
	NUT
}