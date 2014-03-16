package th.ac.chula.bsd.wheel

import java.util.Date;
import java.util.Set;

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
	
	Set requisitions = []
	static hasMany = [
		requisitions: RequisitionLine
		]
	
	static constraints = {
		createdDate blank:false
		updatedDate blank: false
		startDate blank: false
		endDate blank: false
		status nullable: false
	}
	
	public void initialInstall(Appointment ap){
		this.appointment = ap
		this.branch = ap.branch
		this.createdBy = ap.createdBy
		this.updatedBy = ap.updatedBy
	}
	
	public void prepareInstall(){
		this.status = InstallationStatus.PREPARE_INSTALL
		// TODO set requisition status -> ready requsit
		 for(req in this.requisitions){		 
			 RequisitionLine r = req
			 r.readyRequisit();
			 this.status = InstallationStatus.PREPARE_INSTALL		 
		 }
	}
	
	public void cancelInstall(){
		this.status = InstallationStatus.CANCEL
		// TODO return requisit to stock and set status 'Cancel'
		for(req in this.requisitions){
			RequisitionLine r =req
			r.cancelRequisit()
		}
	}
	
	public void installing(){
		this.status = InstallationStatus.INSTALLING
		for(req in this.requisitions){
			RequisitionLine r = req
			r.requisited()
		 }
	}	
	
	public void finishedInstall(){
		this.status = InstallationStatus.FINISHED;	 
	}
	
	public void addRequisition(Product prod, int amount){
		RequisitionLine req = new RequisitionLine()
		req.initialRequisition(this, prod, amount)
		this.requisitions.add(req)
	}
	
	public Boolean checkprepareInstall(){
		Boolean result = false
		if(status==InstallationStatus.NEW){
		   def isProductstock = checkProdstock()  
		    if (isProductstock) {    
			prepareInstall() 
			result =true
		    }
		}
		return result
	}
	
	public Boolean checkinstalling(){  
		Boolean result = false
		if(status==InstallationStatus.PREPARE_INSTALL ){ 
		  installing()	
		  result=true
		}
		return result
	}
	
	public Boolean checkfinished(){
		Boolean result = false
		if(status==InstallationStatus.INSTALLING){
			finishedInstall()
			result = true
		}
		return result
	}
	
	public Boolean checkProdstock(){
		Boolean result = true
		for(req in this.requisitions){
		   RequisitionLine r = req	  
		   if (!r.checkProductStock()){
		     result = false
			 break
		   }
		}
		return result
	}
 
}

enum InstallationStatus {
	NEW,
	PREPARE_INSTALL,
	INSTALLING,
	FINISHED,
	CANCEL
}