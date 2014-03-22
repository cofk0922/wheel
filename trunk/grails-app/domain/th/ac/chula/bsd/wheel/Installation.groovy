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
		 for(req in this.requisitions){		 
			 RequisitionLine r = req
			 r.readyRequisit();
			 this.status = InstallationStatus.PREPARE_INSTALL		 
		 }
	}
	
	public Boolean cancelInstall(){
		Boolean isSuccess = false
		if(this.status == InstallationStatus.NEW){
			this.status = InstallationStatus.CANCEL
			for(req in this.requisitions){
				RequisitionLine r =req
				r.cancelRequisit()
			}
			isSuccess = true
		}
		return isSuccess
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
		if(this.status==InstallationStatus.NEW){
		    if (this.checkProdstock()) {    
				this.prepareInstall() 
				result =true
		    }
		}
		println 'install install isSuccess: '+ result
		return result
	}
	
	public Boolean checkinstalling(){  
		Boolean result = false
		if(this.status==InstallationStatus.PREPARE_INSTALL ){ 
		  installing()	
		  result=true
		}
		return result
	}
	
	public Boolean checkfinished(){
		Boolean result = false
		if(this.status==InstallationStatus.INSTALLING){
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
	//READY_INSTALL,
	INSTALLING,
	FINISHED,
	CANCEL
}