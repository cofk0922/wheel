package th.ac.chula.bsd.wheel

class ProductBranchTransfer {
	int transferDay = 0
	int transferHour = 0
	int transferMinute = 0
	
	Branch branchFrom
	Branch branchTo
	
	static belongTo = [
		branchFrom: Branch
		]

	static constraints = {
	}
}
