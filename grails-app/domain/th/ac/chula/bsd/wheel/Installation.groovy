package th.ac.chula.bsd.wheel

import java.util.Date;

import th.ac.chula.bsd.security.User;

class Installation {
	Date startDate = new Date()
	Date endDate = new Date()
	Date createdDate = new Date()
	Date updatedDate = new Date()
	
	InstallationStatus status = InstallationStatus.NEW
	
	User createdBy
	User updatedBy
		
	static belongsTo = [
		branch: Branch,
		appointment: Appointment/*,
		createdBy: User*/
		]
	
	static hasMany = [
			// TODO Requisition
		]
	
	static constraints = {
		createdDate blank:false
		updatedDate blank: false
		startDate blank: false
		endDate blank: false
		status nullable: false
	}
	
	public void prepareInstall(){
		this.status = InstallationStatus.PREPARE_INSTALL
		// TODO set requisition status -> ready requsit
		// for(req in list)
	}
	
	public void cancelInstall(){
		this.status = InstallationStatus.CANCEL
		// TODO return requisit to stock and set status 'Cancel'
	}
}

enum InstallationStatus {
	NEW,
	PREPARE_INSTALL,
	INSTALLING,
	FINISHED,
	CANCEL
}