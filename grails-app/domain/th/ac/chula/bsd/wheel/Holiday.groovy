package th.ac.chula.bsd.wheel

import java.util.Date;

class Holiday {
	
	Date holidayDate
	String holidayName
		
	static constraints = {
		holidayDate blank: false
		holidayName nullable: true
	}
}
