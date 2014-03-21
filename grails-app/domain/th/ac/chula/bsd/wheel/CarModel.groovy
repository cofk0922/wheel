package th.ac.chula.bsd.wheel

import java.util.Set;

class CarModel {
	
	String modelName
	int year
	String pcdCode
	Float offSet
	Float weight
	Float gearRatio
	MaxWheel defaultWheel
	int defaultTireSize
	float nutSize
	
//	Set wheelList = []
	static hasMany = [wheelLists: CarWheelList, carColor: CarColor]
	
	static hasOne = [band: CarBand]
	
	static constraints = {
		defaultWheel nullable: false
	}
	
	String toString() {
		return this.modelName
	}
	
	public CarModel()
	{
		//Call service initialWheelListForNewCar()
	}
	
	public void CheckRate()
	{
		//TO DO Calculate score for all wheel avaliable for this car
	}

}
