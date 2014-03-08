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
	
	public Car(String cBand, String cModel, int cYear, String cCode, Float cOffSet, Float cSpace, Float cWeight, Float cGearRatio)
	{
		this.band = cBand
		this.model = cModel
		this.year = cYear
		this.pcdCode = cCode
		this.offSet = cOffSet
		this.wheelSpace = cSpace
		this.weight = cWeight
		this.gearRatio = cGearRatio
		
		//get all possible wheel by 
	}
	
	public void CheckRate()
	{
		//TO DO Calculate score for all wheel avaliable for this car
	}
}
