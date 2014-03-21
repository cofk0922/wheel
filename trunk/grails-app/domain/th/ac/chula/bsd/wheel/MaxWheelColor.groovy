package th.ac.chula.bsd.wheel

class MaxWheelColor {

	String	colorName
	//Color code in HSV standard
	String  hVal = 0
	String  sVal = 0
	String  vVal = 0
	
	//Color code in RGB standar (Hexadecimal Format)
	String  hexVal = 0
	
	String wheelImage
	
	//static hasOne = [maxWheel: MaxWheel]
	static belongsTo = [maxWheel: MaxWheel]
	
    static constraints = {
    }
}
