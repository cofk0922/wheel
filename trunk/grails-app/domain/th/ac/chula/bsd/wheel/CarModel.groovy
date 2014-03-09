package th.ac.chula.bsd.wheel

import java.util.Set;

class CarModel {
	String band
	String model
	int year
	String pcdCode
	Float offSet
	Float weight
	Float gearRatio
	MaxWheel defaultWheel
	int defaultTireSize

//	Set wheelList = []
	static hasMany = [wheelLists: CarWheelList]
	
	static constraints = {
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
