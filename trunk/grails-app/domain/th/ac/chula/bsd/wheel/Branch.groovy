package th.ac.chula.bsd.wheel

class Branch {
	
	static HasMany = [productStocks:ProductStock]
	String branchName
    static constraints = {
    }
}
