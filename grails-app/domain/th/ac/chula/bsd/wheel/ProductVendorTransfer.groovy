package th.ac.chula.bsd.wheel

class ProductVendorTransfer {
	int transferDay = 0
	int transferHour = 0
	int transferMinute = 0
	Double unitPrice = 0.0
	
	static hasOne = [
		branch: Branch,
		product: Product,
		vendor: Vendor
	]
	
	static constraints = {
	}
}
