package th.ac.chula.bsd.wheel

import java.util.Set;

class CarModel {
	
	String model
	int year
	String pcdCode
	Float offSet
	Float weight
	Float gearRatio
	//MaxWheel defaultWheel
	int defaultTireSize
	
	// Position Wheel front 
	Integer frontX1
	Integer frontY1
	Integer frontX2
	Integer frontY2
	Integer frontWidth
	Integer frontHeight
		
	//Position Wheel back	
	Integer backX1
	Integer backY1
	Integer backX2
	Integer backY
	Integer backWidth
	Integer backHeight
	
	String  hVal
	String  sVal
	String  vVal
	String  hexVal
	
	String carImage
	
//	Set wheelList = []
	static hasMany = [wheelLists: CarWheelList]
	
	static hasOne = [band: CarBand]
	
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
