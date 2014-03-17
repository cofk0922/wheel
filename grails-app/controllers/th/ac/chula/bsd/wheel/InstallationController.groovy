package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class InstallationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def springSecurityService
	
    def index(Integer max) {
		def	listInstall= Installation.withCriteria {
			and {
				eq("status",InstallationStatus.NEW)
				//eq("status",InstallationStatus.PREPARE_INSTALL)
				//eq("status",InstallationStatus.INSTALLING)
			}
			and {
				order("startDate", "asc")
				order("endDate", "asc")
			}
		}
		def install = listInstall.find{it}
		install.checkprepareInstall()
		install.save flush:true
		println 'Status PrepareInstall :' + install.status
	 
		 install.checkinstalling()
		install.save flush:true
		println 'Status Installing :' + install.status
		 
		install.checkfinished()
		install.save flush:true
		println 'Status Finished:' + install.status
  
		/*
        params.max = Math.min(max ?: 10, 100)
        respond Installation.list(params), model:[installationInstanceCount: Installation.count()]
        */
    }

    def show(Installation installationInstance) {
        respond installationInstance
    }

    def create() {
        respond new Installation(params)
    }

    @Transactional
    def save(Installation installationInstance) {
        if (installationInstance == null) {
            notFound()
            return
        }

        if (installationInstance.hasErrors()) {
            respond installationInstance.errors, view:'create'
            return
        }

        installationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'installationInstance.label', default: 'Installation'), installationInstance.id])
                redirect installationInstance
            }
            '*' { respond installationInstance, [status: CREATED] }
        }
    }

    def edit(Installation installationInstance) {
        respond installationInstance
    }

    @Transactional
    def update(Installation installationInstance) {
        if (installationInstance == null) {
            notFound()
            return
        }

        if (installationInstance.hasErrors()) {
            respond installationInstance.errors, view:'edit'
            return
        }

        installationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
                redirect installationInstance
            }
            '*'{ respond installationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Installation installationInstance) {

        if (installationInstance == null) {
            notFound()
            return
        }

        installationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'installationInstance.label', default: 'Installation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	// Aom
	@Transactional
	def prepareInstall(Installation installationInstance) {
		if (installationInstance == null) {
			notFound()
			return
		}

		if (installationInstance.hasErrors()) {
			respond installationInstance.errors, view:'edit'
			return
		}
		installationInstance.checkprepareInstall()

		installationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
				redirect installationInstance
			}
			'*'{ respond installationInstance, [status: OK] }
		}
	}
	
	@Transactional
	def intalling(Installation installationInstance) {
		if (installationInstance == null) {
			notFound()
			return
		}

		if (installationInstance.hasErrors()) {
			respond installationInstance.errors, view:'edit'
			return
		}
		installationInstance.checkinstalling()

		installationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
				redirect installationInstance
			}
			'*'{ respond installationInstance, [status: OK] }
		}
	}
	
	@Transactional
	def finished(Installation installationInstance) {
		if (installationInstance == null) {
			notFound()
			return
		}

		if (installationInstance.hasErrors()) {
			respond installationInstance.errors, view:'edit'
			return
		}
		installationInstance.checkfinished()

		installationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Installation.label', default: 'Installation'), installationInstance.id])
				redirect installationInstance
			}
			'*'{ respond installationInstance, [status: OK] }
		}
	}
}
