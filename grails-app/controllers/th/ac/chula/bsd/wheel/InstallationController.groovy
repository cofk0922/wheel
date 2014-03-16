package th.ac.chula.bsd.wheel

import grails.transaction.Transactional;
import grails.plugin.springsecurity.annotation.Secured;

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class InstallationController {
	def springSecurityService
	@Transactional
    def index() {
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
  
	}
	
	def show(Installation installationInstance) {
		respond installationInstance
	}
	 
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
