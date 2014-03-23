package th.ac.chula.bsd.inventory



import static org.springframework.http.HttpStatus.*
import th.ac.chula.bsd.wheel.Branch;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional
import grails.converters.JSON

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER', 'ROLE_TECH'])
@Transactional(readOnly = true)
class PreProductPurchaseLineController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		def prePurchase = PreProductPurchaseLine.withCriteria{
			eq('branch.id', b.id)
			'in'("status",[PreProductPurchaseStatus.NEW])
			and{
				order('appointment.id', 'asc')
				order('updatedDate', 'asc')
			}
		}
		println 'prePurchase size: '+ prePurchase.size()
        params.max = Math.min(max ?: 10, 100)
        respond PreProductPurchaseLine.list(params), model:[preProductPurchaseLineInstanceCount: PreProductPurchaseLine.count()]
    }

    def show(PreProductPurchaseLine preProductPurchaseLineInstance) {
        respond preProductPurchaseLineInstance
    }

    def create() {
        respond new PreProductPurchaseLine(params)
    }

    @Transactional
    def save(PreProductPurchaseLine preProductPurchaseLineInstance) {
        if (preProductPurchaseLineInstance == null) {
            notFound()
            return
        }

        if (preProductPurchaseLineInstance.hasErrors()) {
            respond preProductPurchaseLineInstance.errors, view:'create'
            return
        }

        preProductPurchaseLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'preProductPurchaseLineInstance.label', default: 'PreProductPurchaseLine'), preProductPurchaseLineInstance.id])
                redirect preProductPurchaseLineInstance
            }
            '*' { respond preProductPurchaseLineInstance, [status: CREATED] }
        }
    }

    def edit(PreProductPurchaseLine preProductPurchaseLineInstance) {
        respond preProductPurchaseLineInstance
    }

    @Transactional
    def update(PreProductPurchaseLine preProductPurchaseLineInstance) {
        if (preProductPurchaseLineInstance == null) {
            notFound()
            return
        }

        if (preProductPurchaseLineInstance.hasErrors()) {
            respond preProductPurchaseLineInstance.errors, view:'edit'
            return
        }

        preProductPurchaseLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PreProductPurchaseLine.label', default: 'PreProductPurchaseLine'), preProductPurchaseLineInstance.id])
                redirect preProductPurchaseLineInstance
            }
            '*'{ respond preProductPurchaseLineInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PreProductPurchaseLine preProductPurchaseLineInstance) {

        if (preProductPurchaseLineInstance == null) {
            notFound()
            return
        }

        preProductPurchaseLineInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PreProductPurchaseLine.label', default: 'PreProductPurchaseLine'), preProductPurchaseLineInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'preProductPurchaseLineInstance.label', default: 'PreProductPurchaseLine'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def orderGrid(){}
	
	def createPO(){}
	
	def savePO(){
		
		println "id = "+ params.id;
		println "payType = "+ params.payType;
		def results = ['success': true];
		render results as JSON
	}
	
	def getOrderListPO(){
		
		def results = [['No' : '1','productName' : 'Tamiya','unitPrice':'12500','amt': '1','total':'12500']];
		render results as JSON
	}
	
	def getOrderList(){
		
		println "id = "+ params.id
		
		def results=[];
		def results1 = [['appointmentID' : '1','productName' : 'Tamiya','purschaseAmt':'2','suggestVendorName': 'Gchoi'],
			['appointmentID' : '1','productName' : 'tooFast','purschaseAmt':'2','suggestVendorName': 'Gchoi']];
		
		def results2 = [['appointmentID' : '1','productName' : 'Tamiya','purschaseAmt':'2','suggestVendorName': 'jam square'],
			['appointmentID' : '1','productName' : 'tooFast','purschaseAmt':'2','suggestVendorName': 'jam square']];
		   
		if (params.id == "0")
		{
			results = results1+results2;
		}
		
		if (params.id == "1")
		{
			results = results1;
		}
	
	
		if (params.id == "2")
		{
			results = results2;
		}
		
		render results as JSON
	}
	
	def getVendorDetails(){
		println params.id
		
		def result = ['poNo': '1','poDate':'23/3/2014','arrivalDate':'28/3/2014',
			'vendorName': 'Gchoice','vendorAddress':'xxxxxx','total':'12000',
			'vat':'500','netTotal':'12500'];
		render result as JSON
	}
	
	def getVendorList(){
		
		def result = ['0': 'All','1':'Gchoi','2':'jam square'];
		
		render result as JSON
	}
}
