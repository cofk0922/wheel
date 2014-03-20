package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VendorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vendor.list(params), model:[vendorInstanceCount: Vendor.count()]
    }

    def show(Vendor vendorInstance) {
        respond vendorInstance
    }

    def create() {
        respond new Vendor(params)
    }

    @Transactional
    def save(Vendor vendorInstance) {
        if (vendorInstance == null) {
            notFound()
            return
        }

        if (vendorInstance.hasErrors()) {
            respond vendorInstance.errors, view:'create'
            return
        }

        vendorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vendorInstance.label', default: 'Vendor'), vendorInstance.vendorName])
                redirect vendorInstance
            }
            '*' { respond vendorInstance, [status: CREATED] }
        }
    }

    def edit(Vendor vendorInstance) {
        respond vendorInstance
    }

    @Transactional
    def update(Vendor vendorInstance) {
        if (vendorInstance == null) {
            notFound()
            return
        }

        if (vendorInstance.hasErrors()) {
            respond vendorInstance.errors, view:'edit'
            return
        }

        vendorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vendor.label', default: 'Vendor'), vendorInstance.vendorName])
                redirect vendorInstance
            }
            '*'{ respond vendorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vendor vendorInstance) {

        if (vendorInstance == null) {
            notFound()
            return
        }

        vendorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vendor.label', default: 'Vendor'), vendorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendorInstance.label', default: 'Vendor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
