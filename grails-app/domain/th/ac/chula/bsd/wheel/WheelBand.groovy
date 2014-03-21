package th.ac.chula.bsd.wheel

class WheelBand {
	
	static hasMany =[wheelModel:MaxWheel] 
	String name

    static constraints = {
		name nullable: false
    }
}
