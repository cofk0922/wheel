package th.ac.chula.bsd.wheel

class MaxWheel extends Product{

	// Inherit [prodName, prodDesc] from Product
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
}

enum ProdStatus{
	SOON,
	AVALIABLE,
	CANCEL
}