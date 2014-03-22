package th.ac.chula.bsd.wheel

import org.springframework.aop.aspectj.RuntimeTestWalker.ThisInstanceOfResidueTestVisitor;

class CarWheelList {
	
	Integer listOrder 
	UsageType usageType
	Double drivingEnergy
	Double tractiveEnergy
	int	usageScore
	Integer	driveStar
	Integer tractiveStar
	
	static belongsTo = [wheel: MaxWheel,car: CarModel]
	
    static constraints = {
    }
	
	public CarWheelList(CarModel lCar, MaxWheel lWheel, UsageType lUsageType)
	{
		this.car = lCar
		this.wheel = lWheel
		this.usageType = lUsageType
		this.usageScoring()
		this.drivingEnergy = this.calcDrivingEnergy()
		this.tractiveEnergy = this.calcTractiveEnergy()
		this.listOrder = 0
		this.driveStar = 0
		this.tractiveStar = 0
	}
	
	public void setDriveStar(){
		def stdev = this.car.getStdevDrivingEnergy(this.usageType)
		def mean = this.car.getMeanDrivingEnergy(this.usageType)
		def oneStar = mean - (1.5 * stdev)
		def twoStar = mean - (0.5 * stdev)
		def threeStar = mean + (0.5 * stdev)
		def fourStar = mean + (1.5 * stdev)
		
		if(this.drivingEnergy <= oneStar){
			this.driveStar = 1
		}
		else if(this.drivingEnergy <= twoStar){
			this.driveStar = 2
		}
		else if(this.drivingEnergy <= threeStar){
			this.driveStar = 3
		}
		else if(this.drivingEnergy <= fourStar){
			this.driveStar = 4
		}
		else{
			this.driveStar = 5
		}
		println("driveStar"+this.driveStar)
	}
	
	public void setTractiveStar(){
		def stdev = this.car.getStdevTractiveEnergy(this.usageType)
		def mean = this.car.getMeanTractiveEnergy(this.usageType)
		def oneStar = mean - (1.5 * stdev)
		def twoStar = mean - (0.5 * stdev)
		def threeStar = mean + (0.5 * stdev)
		def fourStar = mean + (1.5 * stdev)
		
		if(this.tractiveEnergy <= oneStar){
			this.tractiveStar = 1
		}
		else if(this.tractiveEnergy <= twoStar){
			this.tractiveStar = 2
		}
		else if(this.tractiveEnergy <= threeStar){
			this.tractiveStar = 3
		}
		else if(this.tractiveEnergy <= fourStar){
			this.tractiveStar = 4
		}
		else{
			this.tractiveStar = 5
		}
		println("tractiveStar"+this.tractiveStar)
	}
	
	private double calcDrivingEnergy()
	{
		//Calculate energy using when drive "0.6732 mvtL/gear ratio"
		//v = 22.2222 m/s(80km/h), t = 60 sec
		return (897.5991024 * car.weight * wheel.getCmSize()) /  car.gearRatio
	}
	
	private double calcTractiveEnergy()
	{
		//Calculate energy using when start "1.3464 mumgL/gear ratio"
		//mu = 0.55, g = 9.8 m/ss
		return (7.257096 * car.weight * wheel.getCmSize()) /  car.gearRatio
	}
	
	private void usageScoring()
	{
		def uScore = UsageScore.findBySTypeAndUType(this.wheel.spoke,  this.usageType)
		this.usageScore =  uScore.score
		println("[PONG]usageScore: "+ this.usageScore)
	}
}
