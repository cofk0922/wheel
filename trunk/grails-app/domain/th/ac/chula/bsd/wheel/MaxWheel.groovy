package th.ac.chula.bsd.wheel

class MaxWheel extends Product{

	// Inherit [prodName, prodDesc] from Product
	WheelBand band
	String series
	String pcdCode //Number of nuts depend on integer part of PCD Code (5-6)
	int offSet
	Float size
	Float width
	Float weight
	SpokeType spoke
	ProdStatus pStatus
	Float nutSize
	
	static hasMany = [wheelLists: CarWheelList, dWheel: DefaultWheel, maxWheelColor: MaxWheelColor]

    static constraints = {
		band blank: false
		series blank: false
		size nullable: false
		width nullable: false;
		weight nullable: true;
		pcdCode nullable: false;
    }
	
	public Double getCmSize()
	{
		return this.size * 0.0254
	}
}

enum ProdStatus{
	SOON,
	AVALIABLE,
	CANCEL
}