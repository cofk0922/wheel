package th.ac.chula.bsd.inventory

class PurchasePaymentType {

	String paymentTypeName
	
    static constraints = {
		paymentTypeName blank: false
    }
}
