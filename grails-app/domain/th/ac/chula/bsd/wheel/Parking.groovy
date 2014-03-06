package th.ac.chula.bsd.wheel

import java.util.Date;

class Parking {
	Date startDate = new Date()
	Date endDate = new Date()
		
	ParkingStatus status = ParkingStatus.RESERVE
	
	static belongsTo = [
		branch: Branch,
		appointment:Appointment
		]
	
	static constraints = {
		startDate blank: false
		endDate blank: false
		status nullable: false
	}
	
	public void cancelPark() {
		this.status = ParkingStatus.CANCEL
	}
	
	public void returnCar(){
		this.status = ParkingStatus.UNRESERVE
	}
}

enum ParkingStatus {
	RESERVE,
	UNRESERVE,
	IDEL,
	CANCEL
}