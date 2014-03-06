package th.ac.chula.bsd.wheel

class WorkDay {
	String workDayName
	int workDayCode
	int startHour = 8
	int startMinute = 0
	int endHour = 17
	int endMinute = 0
	boolean workActive
	
	static belongsTo = [branch:Branch]
	
	static constraints = {
		workDayName blank: false
		startHour nullable: true
		startMinute nullable: true
		endHour nullable: true
		endMinute nullable: true
		workActive blank: false
		
		workDayCode inList: WorkDayCode.values()*.id
	}
	
}

enum WorkDayCode{
	SUNDAY(1), MONDAY(2), TUESDAY(3), WENDSDAY(4), THURSDAY(5), FRIDAY(6), SATURDAY(7)
	
	int id
	public WorkDayCode(int id){
		this.id = id
	}
	
	int value() {return value}
	
	static WorkDayCode byTd(int id){
		values().find{it.id == id}
	}
}