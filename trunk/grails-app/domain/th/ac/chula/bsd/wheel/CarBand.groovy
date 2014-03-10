package th.ac.chula.bsd.wheel

class CarBand {
	
	String bandName
	
	static hasMany = [models: CarModel, dWheel: DefaultWheel]
	
    static constraints = {
    }
}
