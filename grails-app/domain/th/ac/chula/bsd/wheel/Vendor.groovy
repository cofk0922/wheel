package th.ac.chula.bsd.wheel

class Vendor {
	String vendorName
	String vendorAddress
	
	static hasMany = [
		productVendors: ProductVendorTransfer
		]
	
	static constraints = {
		vendorName blank: false
		vendorAddress blank: false
	}
	
	String toString() {
		return this.vendorName
	}

}
