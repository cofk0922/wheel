package th.ac.chula.bsd.wheel

import java.util.Set;

class Car {
	String band
	String model
	int year
	String pcdCode
	Float offSet
	Float wheelSpace
	Float weight
	Float gearRatio
	MaxWheel defaultWheel
	int defaultTireSize

//	Set wheelList = []
	static hasMany = [wheelLists: CarWheelList]
	
	static constraints = {
		band nullable: false
		model nullable: false
		pcdCode nullable: false
	}
	
	public Car()
	{
		//Constructer
	}
	
	public void CheckRate()
	{
		//TO DO Calculate score for all wheel avaliable for this car
	}
}
