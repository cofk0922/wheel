package th.ac.chula.bsd.wheel

class MaxWheel extends Product{

	String band
	String model
	String pcdCode
	int offSet
	Float size
	Float width
	Float weight
	SpokeType spoke
	
	//Set wheelList = []
	static hasMany = [wheelLists: CarWheelList]

    static constraints = {
		band blank: false
		model blank: false
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