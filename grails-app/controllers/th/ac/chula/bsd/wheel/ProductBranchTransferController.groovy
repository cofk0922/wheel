package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*

import com.sun.org.apache.bcel.internal.generic.BranchInstruction;

import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class ProductBranchTransferController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		//b.refresh()
		
		//def branchTFrom = ProductBranchTransfer.findAll("from ProductBranchTransfer as tran join fetch tran.branchFrom as bFrom where tran.branchTo.id = ? order by bFrom.branchName", [b.id])
		def branchTFrom = ProductBranchTransfer.withCriteria{
			eq('branchTo.id', b.id)
			and{
				order('transferDay', 'asc')
				order('transferHour', 'asc')
				order('transferMinute', 'asc')
			}
			
		}
		params.branch = b
        params.max = Math.min(max ?: 10, 100)
        //respond ProductBranchTransfer.list(params), model:[productBranchTransferInstanceCount: ProductBranchTransfer.count()]
		respond branchTFrom, model:[productBranchTransferInstanceCount: branchTFrom.size()]
    }

    def show(ProductBranchTransfer productBranchTransferInstance) {
        respond productBranchTransferInstance
    }

    def create() {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		params.branch = b
		def existBranchFrom = ProductBranchTransfer.withCriteria{
			projections {
				property('branchFrom.id')
			}
			eq('branchTo.id', b.id)
		}
		println ('existBranchFrom: '+ existBranchFrom)
		if(existBranchFrom.size() <= 0){
			params.branchList = Branch.withCriteria{
				and{
					ne('id', b.id)
				}
			}
		} else {
			params.branchList = Branch.withCriteria{
				and{
					ne('id', b.id)
					not{'in'('id', existBranchFrom)}
				}
			}
		}

        respond new ProductBranchTransfer(params)
    }

    @Transactional
    def save(ProductBranchTransfer productBranchTransferInstance) {
        if (productBranchTransferInstance == null) {
            notFound()
            return
        }
		
		println 'save new item'
		def u = springSecurityService.currentUser
		Branch b = u.branch
		b.refresh()
		productBranchTransferInstance.branchTo = b
		
        if (productBranchTransferInstance.hasErrors()) {
			params.branch = b
			params.branchList = Branch.withCriteria{ne('id', b.id)}
            respond productBranchTransferInstance.errors, view:'create'
            return
        }
        
		params.branchName = b.branchName
		def prodBTrans = ProductBranchTransfer.withCriteria{
			eq('branchTo.id', b.id)
			eq('branchFrom.id', productBranchTransferInstance.branchFrom.id)
		}
		if(prodBTrans.size() > 0){
			prodBTrans.transferDay = productBranchTransferInstance.transferDay
			prodBTrans.transferHour = productBranchTransferInstance.transferHour
			prodBTrans.transferMinute = productBranchTransferInstance.transferMinute
			prodBTrans.save flush:true
		} else {
			productBranchTransferInstance.branchTo = b
			productBranchTransferInstance.save flush:true
			// create backward
			def prodTTo = new ProductBranchTransfer()
			prodTTo.initialProductBranchTransfer(b, productBranchTransferInstance.branchFrom)
			prodTTo.transferDay = productBranchTransferInstance.transferDay
			prodTTo.transferHour = productBranchTransferInstance.transferHour
			prodTTo.transferMinute = productBranchTransferInstance.transferMinute
			prodTTo.save()
		}

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productBranchTransferInstance.label', default: 'ProductBranchTransfer'), ''])
                redirect productBranchTransferInstance
            }
            '*' { respond productBranchTransferInstance, [status: CREATED] }
        }
    }

    def edit(ProductBranchTransfer productBranchTransferInstance) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		params.branch = b
		params.branchList = Branch.withCriteria{eq('id', productBranchTransferInstance.branchFrom.id)}
        respond productBranchTransferInstance
    }

    @Transactional
    def update(ProductBranchTransfer productBranchTransferInstance) {
        if (productBranchTransferInstance == null) {
            notFound()
            return
        }

        if (productBranchTransferInstance.hasErrors()) {
            respond productBranchTransferInstance.errors, view:'edit'
            return
        }

        productBranchTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductBranchTransfer.label', default: 'ProductBranchTransfer'), ''])
                redirect productBranchTransferInstance
            }
            '*'{ respond productBranchTransferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductBranchTransfer productBranchTransferInstance) {

        if (productBranchTransferInstance == null) {
            notFound()
            return
        }

        productBranchTransferInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductBranchTransfer.label', default: 'ProductBranchTransfer'), productBranchTransferInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productBranchTransferInstance.label', default: 'ProductBranchTransfer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
