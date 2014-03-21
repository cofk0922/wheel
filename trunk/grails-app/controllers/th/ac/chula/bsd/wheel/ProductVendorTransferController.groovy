package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class ProductVendorTransferController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def prod = Product.get(Long.valueOf(params.prodID))
		params.prodID = prod.id
		params.prodType = prod.productType.name()
		params.product = prod
		
		def u = springSecurityService.currentUser
		Branch b = u.branch
		//b.refresh()
		
		println 'prodID: '+ params.prodID
		
		def vendorTran = ProductVendorTransfer.findAll("from ProductVendorTransfer as tran join fetch tran.vendor as ven where tran.branch.id = ? and tran.product.id = ? order by ven.vendorName", [b.id,  Long.valueOf(params.prodID)])
		println('vendor Trans : '+ vendorTran)
		println('vendor Trans Size : '+ vendorTran.size())
		
		/*
		def vendorTran = ProductVendorTransfer.withCriteria{
			eq('branch.id', b.id)
			and{
				order('vendor.id', 'asc')
			}
		}*/
        params.max = Math.min(max ?: 10, 100)
        //respond ProductVendorTransfer.list(params), model:[productVendorTransferInstanceCount: ProductVendorTransfer.count()]
		respond vendorTran, model:[productVendorTransferInstanceCount: vendorTran.size()]
    }

    def show(ProductVendorTransfer productVendorTransferInstance) {
		def prod = Product.get(productVendorTransferInstance.product.id)
		params.prodID = prod.id
		params.prodType = prod.productType.name()
		params.product = prod
        respond productVendorTransferInstance
    }

    def create() {
		params.prodID = params.prodID
		params.prodType = params.prodType
		def u = springSecurityService.currentUser
		Branch b = u.branch
		params.branch = b
		params.product = Product.get(Long.valueOf(params.prodID))
		
		def existVendor = ProductVendorTransfer.withCriteria{
			projections {
				property('vendor.id')
			}
			and {
				eq('branch.id', b.id)
				eq('product.id', Long.valueOf(params.prodID))
			}
		}
		println 'exist : '+ existVendor
		if(existVendor.size() > 0){
			params.vendorList = Vendor.withCriteria{
				not{'in'('id', existVendor)}
			}
		} else {
		params.vendorList = Vendor.findAll()
		}
		
        respond new ProductVendorTransfer(params)
    }

    @Transactional
    def save(ProductVendorTransfer productVendorTransferInstance) {
		def prod = Product.get(productVendorTransferInstance.product.id)
		params.prodID = prod.id
		params.prodType = prod.productType.name()
        if (productVendorTransferInstance == null) {
            notFound()
            return
        }

        if (productVendorTransferInstance.hasErrors()) {
            respond productVendorTransferInstance.errors, view:'create'
            return
        }

        productVendorTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'productVendorTransferInstance.label', default: 'ProductVendorTransfer'), ''])
                redirect productVendorTransferInstance
            }
            '*' { respond productVendorTransferInstance, [status: CREATED] }
        }
    }

    def edit(ProductVendorTransfer productVendorTransferInstance) {
		params.prodID = productVendorTransferInstance.product.id
		params.prodType = productVendorTransferInstance.product.productType.name()
		params.product = productVendorTransferInstance.product
		def u = springSecurityService.currentUser
		Branch b = u.branch
		params.branch = b
		//params.product = Product.get(Long.valueOf(params.prodID))
		params.vendorList = Vendor.withCriteria{ eq('id', productVendorTransferInstance.vendor.id) }
        respond productVendorTransferInstance
    }

    @Transactional
    def update(ProductVendorTransfer productVendorTransferInstance) {
		def prod = Product.get(productVendorTransferInstance.product.id)
		params.prodID = prod.id
		params.prodType = prod.productType.name()
        if (productVendorTransferInstance == null) {
            notFound()
            return
        }

        if (productVendorTransferInstance.hasErrors()) {
			params.prodID = params.prodID
			params.prodType = params.prodType
            respond productVendorTransferInstance.errors, view:'edit'
            return
        }

        productVendorTransferInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProductVendorTransfer.label', default: 'ProductVendorTransfer'), ''])
                redirect productVendorTransferInstance
            }
            '*'{ respond productVendorTransferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProductVendorTransfer productVendorTransferInstance) {
		params.prodID = productVendorTransferInstance.product.id
		params.prodType = productVendorTransferInstance.product.productType.name()
        if (productVendorTransferInstance == null) {
            notFound()
            return
        }

        productVendorTransferInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProductVendorTransfer.label', default: 'ProductVendorTransfer'), ''])
                redirect action:"index", method:"GET", params:[prodID: params.prodID, prodType: params.prodType]
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'productVendorTransferInstance.label', default: 'ProductVendorTransfer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
