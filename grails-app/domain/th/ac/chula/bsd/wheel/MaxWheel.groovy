package th.ac.chula.bsd.wheel

class MaxWheel {

	WheelBand band
	String series
	String pcdCode //Number of nuts depend on integer part of PCD Code (5-6)
	Float offSet
	Float size
	Float width
	Float weight
	SpokeType spoke
	ProdStatus pStatus
	CarBand forCarBand
	
	static hasMany = [wheelLists: CarWheelList, dWheel: DefaultWheel, maxWheelColor: MaxWheelColor]

    static constraints = {
		band blank: false
		series blank: false
		size nullable: false
		width nullable: false;
		weight nullable: true;
		pcdCode nullable: false;
		forCarBand nullable: true;
    }
	
	public Double getCmSize()	{
		return this.size * 0.0254
	}
	
	public getInchOffSet(){
		return this.offSet * 0.0393701	
	}
	
	public MaxWheelColor getBestHue(String inputHue){
		MaxWheelColor bestHueWheelColor
		def colorList = this.maxWheelColor
		int lowestDiff = 360
		for (item in colorList){
			//compare hue value and keep best wheelcolor
			int currentScore = Math.abs((int)item.hVal-(int)inputHue)
			if( currentScore < lowestDiff ){
				lowestDiff = currentScore
				bestHueWheelColor = item
				println("Best Hue of "+this.series+" is "+item.colorName)
			}
		}
		return bestHueWheelColor
	}
	
	public MaxWheelColor getBestSaturation(String inputSaturation){
		MaxWheelColor bestSaturationWheelColor
		def colorList = this.maxWheelColor
		int lowestDiff = 100
		for (item in colorList){
			//compare saturation value and keep best wheelcolor
			int currentScore = Math.abs((int)item.sVal-(int)inputSaturation)
			if( currentScore < lowestDiff ){
				lowestDiff = currentScore
				bestSaturationWheelColor = item
				println("Best Saturation of "+this.series+" is "+item.colorName)
			}
		}
		return bestSaturationWheelColor
	}
	
	public MaxWheelColor getBestBrightness(String inputValue){
		MaxWheelColor bestBrightnessWheelColor
		def colorList = this.maxWheelColor
		int lowestDiff = 100
		for (item in colorList){
			//compare brightness value and keep best wheelcolor
			int currentScore = Math.abs((int)item.vVal-(int)inputValue)
			if( currentScore < lowestDiff ){
				lowestDiff = currentScore
				bestBrightnessWheelColor = item
				println("Best Brightness of "+this.series+" is "+item.colorName)
			}
		}
		return bestBrightnessWheelColor
	}
	
	public MaxWheelColor getBestHSV(String inputHue, String inputSaturation, String inputValue){
		MaxWheelColor bestHSVWheelColor
		def colorList = this.maxWheelColor
		double lowestDiff = 387
		for (item in colorList){
			//compare HSV value and keep best wheelcolor
			double currentScore = Math.sqrt(Math.pow((double)item.hVal-(double)inputHue,2)+Math.pow((double)item.sVal-(double)inputSaturation,2)+Math.pow((double)item.vVal-(double)inputValue,2))
			if( currentScore < lowestDiff ){
				lowestDiff = currentScore
				bestHSVWheelColor = item
				println("Best Brightness of "+this.series+" is "+item.colorName)
			}
		}
		return bestHSVWheelColor
	}
}

enum ProdStatus{
	SOON,
	AVALIABLE,
	CANCEL
}