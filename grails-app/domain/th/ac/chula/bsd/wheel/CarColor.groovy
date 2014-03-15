package th.ac.chula.bsd.wheel

import java.util.Set;

class CarColor {
	
	String	colorName
	// Position Wheel front 
	Integer frontX1 = 0
	Integer frontY1 = 0
	Integer frontX2 = 0
	Integer frontY2 = 0
	Integer frontWidth = 0
	Integer frontHeight = 0
		
	//Position Wheel back	
	Integer backX1 = 0
	Integer backY1 = 0
	Integer backX2 = 0
	Integer backY = 0
	Integer backWidth = 0
	Integer backHeight = 0
	
	//Color code in HSV standard
	String  hVal = 0
	String  sVal = 0
	String  vVal = 0
	
	//Color code in RGB standar (Hexadecimal Format)
	String  hexVal = 0
	
	String carImage

	static hasOne = [carModel: CarModel]
	
	static constraints = {
	}
}
