package th.ac.chula.bsd.inventory



import static org.springframework.http.HttpStatus.*
import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.wheel.Branch;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class PreProductTransferLineController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		
		this.genSubMenuParam(b)
		
		def statusList = []
		if(params.isViewWait){
			statusList = [PreProductTransferStatus.WAITING_FOR_TRANSFER]
		} else if(params.isViewComplete) {
			statusList = [PreProductTransferStatus.COMPLETE]
		} else {
			statusList = [PreProductTransferStatus.NEW]
		}
		
		def preTran = PreProductTransferLine.withCriteria{
			eq('branch.id', b.id)
			'in'("status",statusList)
			and{
				order('appointment.id', 'asc')
				order('updatedDate', 'asc')
			}
		}
		
		println 'preTran size: '+ preTran.size()
		
        params.max = Math.min(max ?: 10, 100)
		respond preTran, model:[preProductTransferLineInstanceCount: preTran.size()]
        //respond PreProductTransferLine.list(params), model:[preProductTransferLineInstanceCount: PreProductTransferLine.count()]
    }

    def show(PreProductTransferLine preProductTransferLineInstance) {
        respond preProductTransferLineInstance
    }

    def create() {
        respond new PreProductTransferLine(params)
    }

    @Transactional
    def save(PreProductTransferLine preProductTransferLineInstance) {
        if (preProductTransferLineInstance == null) {
            notFound()
            return
        }

        if (preProductTransferLineInstance.hasErrors()) {
            respond preProductTransferLineInstance.errors, view:'create'
            return
        }

        preProductTransferLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'preProductTransferLineInstance.label', default: 'PreProductTransferLine'), preProductTransferLineInstance.id])
                redirect preProductTransferLineInstance
            }
            '*' { respond preProductTransferLineInstance, [status: CREATED] }
        }
    }

    def edit(PreProductTransferLine preProductTransferLineInstance) {
        respond preProductTransferLineInstance
    }

    @Transactional
    def update(PreProductTransferLine preProductTransferLineInstance) {
        if (preProductTransferLineInstance == null) {
            notFound()
            return
        }

        if (preProductTransferLineInstance.hasErrors()) {
            respond preProductTransferLineInstance.errors, view:'edit'
            return
        }

        preProductTransferLineInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PreProductTransferLine.label', default: 'PreProductTransferLine'), preProductTransferLineInstance.id])
                redirect preProductTransferLineInstance
            }
            '*'{ respond preProductTransferLineInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PreProductTransferLine preProductTransferLineInstance) {

        if (preProductTransferLineInstance == null) {
            notFound()
            return
        }

        preProductTransferLineInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PreProductTransferLine.label', default: 'PreProductTransferLine'), preProductTransferLineInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'preProductTransferLineInstance.label', default: 'PreProductTransferLine'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Transactional
	def requestTransfer(PreProductTransferLine preProductTransferLineInstance) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		Branch branchFrom = Branch.get(params.suggestBranch.toInteger())
		preProductTransferLineInstance.addProductTransferLine(u, branchFrom, preProductTransferLineInstance.amount)
		preProductTransferLineInstance.save flush:true
		//preProductTransferLineInstance.addProductTransferLine(u, Branch branchFrom, int transAmt)
		params.isViewNew = true
		this.genSubMenuParam(b)
		
		redirect action: "index", method: "GET", params:[isViewNew:true, listPreTran: params.listPreTran, listTransferTo:params.listTransferTo, listTransferFrom:params.listTransferFrom]
	}
	
	def transferfrom(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		this.genSubMenuParam(b)
		
		def statusList = []
		if(params.isViewTransfered){
			statusList = [ProductTransferStatus.TRANSFERED]
		} else if(params.isViewReceived) {
			statusList = [ProductTransferStatus.RECEIVED]
		} else {
			statusList = [ProductTransferStatus.NEW]
		}
		
		def tranFrom = ProductTransferLine.withCriteria{
			createAlias('branchTo', 'bToAlias')
			createAlias('product', 'productAlias')
			eq('branchFrom.id', b.id)
			'in'("status",statusList)
			and{
				order('bToAlias.branchName', 'asc')
				order('productAlias.prodName', 'asc')
			}
		}
		
		params.max = Math.min(max ?: 10, 100)
		respond tranFrom, model:[productTransferLineInstanceCount:tranFrom.size()]
		//respond ProductTransferLine.list(params), model:[productTransferLineInstanceCount: ProductTransferLine.count()]
	}
	
	@Transactional
	def transferToOther(String productTransferLineInstanceID){
		println 'transferToOther'
		println 'productTransferLineInstance: '+ productTransferLineInstanceID
		def u = springSecurityService.currentUser
		Branch b = u.branch
		def productTransferLineInstance = ProductTransferLine.get(productTransferLineInstanceID.toInteger())
		productTransferLineInstance.beginTransferProduct(u)
		productTransferLineInstance.preTransferLine.checkProductTransferLine()
		productTransferLineInstance.save flush:true
		
		params.isViewNew = true
		this.genSubMenuParam(b)
		
		redirect action: "transferfrom", method: "GET", params:[isViewNew:true, listPreTran: params.listPreTran, listTransferTo:params.listTransferTo, listTransferFrom:params.listTransferFrom]
	}
	
	def transferto(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		this.genSubMenuParam(b)
		
		def statusList = []
		if(params.isViewNew){
			statusList = [ProductTransferStatus.NEW]
		} else if(params.isViewReceived) {
			statusList = [ProductTransferStatus.RECEIVED]
		} else {
			statusList = [ProductTransferStatus.TRANSFERED]
		}
		
		def tranTo = ProductTransferLine.withCriteria{
			createAlias('branchFrom', 'bFromAlias')
			createAlias('product', 'productAlias')
			eq('branchTo.id', b.id)
			'in'("status",statusList)
			and{
				order('bFromAlias.branchName', 'asc')
				order('productAlias.prodName', 'asc')
			}
		}
		
		params.max = Math.min(max ?: 10, 100)
		//respond ProductTransferLine.list(params), model:[productTransferLineInstanceCount: ProductTransferLine.count()]
		respond tranTo, model:[productTransferLineInstanceCount:tranTo.size()]
	}
	
	@Transactional
	def receiveTransfer(String productTransferLineInstanceID){
		println 'transferToOther'
		println 'productTransferLineInstance: '+ productTransferLineInstanceID
		def u = springSecurityService.currentUser
		Branch b = u.branch
		def productTransferLineInstance = ProductTransferLine.get(productTransferLineInstanceID.toInteger())
		productTransferLineInstance.receiveTransfer(u)
		productTransferLineInstance.preTransferLine.checkProductTransferLine()
		productTransferLineInstance.save flush:true
		
		params.isViewNew = true
		this.genSubMenuParam(b)
		
		redirect action: "transferto", method: "GET", params:[isViewTransfered:true, listPreTran: params.listPreTran, listTransferTo:params.listTransferTo, listTransferFrom:params.listTransferFrom]
	}

		//================ Gen Menu Param
	private void genSubMenuParam(Branch b){
		params.listPreTran = "("+(b.preProductTransferLines.findAll{it -> it.status == PreProductTransferStatus.NEW}).size() +")"
		params.listTransferTo = "("+(b.productTransferLineTos.findAll{it -> it.status == ProductTransferStatus.TRANSFERED}).size()+")"
		params.listTransferFrom = "("+(b.productTransferLineFroms.findAll{it -> it.status == ProductTransferStatus.NEW}).size()+")"
		
	}
}
