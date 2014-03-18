package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*

import java.awt.geom.Arc2D.Double;

import th.ac.chula.bsd.security.RoleName;
import th.ac.chula.bsd.security.User;
import th.ac.chula.bsd.security.Role;
import th.ac.chula.bsd.security.UserRole;
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_SUPERADMIN','ROLE_ADMIN'])
@Transactional(readOnly = true)
class BranchController {
	def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
    def index(Integer max) {
		def u = springSecurityService.currentUser
		Branch b = u.branch
		
		def userRole = u.getAuthorities()
		
		if(userRole.find{it -> it.authority == 'ROLE_SUPERADMIN'}){
			params.max = Math.min(max ?: 10, 100)
			respond Branch.list(params), model:[branchInstanceCount: Branch.count()]
		}else {
			redirect(action:'show', id:b.id)
		}
    }

    def show(Branch branchInstance) {
        respond branchInstance
    }

    def create() {
		params.installPrice = 0.00
        respond new Branch(params)
    }

    @Transactional
    def save(Branch branchInstance) {
        if (branchInstance == null) {
            notFound()
            return
        }

        if (branchInstance.hasErrors()) {
            respond branchInstance.errors, view:'create'
            return
        }
		branchInstance.initialWorkDay()
        branchInstance.save flush:true

		// create Admin Branch
		def role = Role.findByAuthority(RoleName.ROLE_ADMIN)
		def adminUser = branchInstance.genAdminUser()
		adminUser.save()
		UserRole.create(adminUser, role,true)

		// create Installation Price
		def Installation = Product.findByProductType(ProductType.INSTALLATION)
		def installStock = new ProductStock()
		installStock.initialProductStock(branchInstance, Installation)
		installStock.stock = 1
		installStock.unitPrice = params.installPrice.toDouble()
		installStock.save()
		
        request.withFormat {
            form {
				flash.message = message(code: 'default.created.message.withother', args: [message(code: 'branchInstance.label', default: 'Branch'), branchInstance.branchName, adminUser.username, message(code: 'role.admin.label', default: 'Admin')])
                //flash.message = message(code: 'default.created.message', args: [message(code: 'branchInstance.label', default: 'Branch'), branchInstance.branchName])
                redirect branchInstance
            }
            '*' { respond branchInstance, [status: CREATED] }
        }
    }

    def edit(Branch branchInstance) {
		def installation = Product.findByProductType(ProductType.INSTALLATION)
		def installStock = branchInstance.getProductStock(installation)
		params.installPrice = installStock.unitPrice
        respond branchInstance
    }

    @Transactional
    def update(Branch branchInstance) {
        if (branchInstance == null) {
            notFound()
            return
        }

        if (branchInstance.hasErrors()) {
            respond branchInstance.errors, view:'edit'
            return
        }

        branchInstance.save flush:true
		
		//Update InstallPrice
		def installation = Product.findByProductType(ProductType.INSTALLATION)
		def installStock = branchInstance.getProductStock(installation)
		installStock.unitPrice = params.installPrice.toDouble()
		installStock.save()

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Branch.label', default: 'Branch'), branchInstance.branchName])
                redirect branchInstance
            }
            '*'{ respond branchInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Branch branchInstance) {

        if (branchInstance == null) {
            notFound()
            return
        }

        branchInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Branch.label', default: 'Branch'), branchInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'branchInstance.label', default: 'Branch'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
