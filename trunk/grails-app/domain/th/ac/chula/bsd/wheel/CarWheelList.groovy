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
	
	public CarWheelList(CarModel lCar, MaxWheel lWheel, String lUsageType)
	{
		this.car = lCar
		this.wheel = lWheel
		this.usageType = lUsageType
		this.UsageScore = this.usageScoring()
		this.drivingEnergy = this.calcDrivingEnergy()
		this.tractiveEnergy = this.calcTractiveEnergy()
	}
	
	private Double calcDrivingEnergy()
	{
		//Calculate energy using when drive "0.6732 mvtL/gear ratio"
		//v = 22.2222 m/s(80km/h), t = 60 sec
		return (897.5991024 * car.weight * wheel.getCmSize()) /  car.gearRatio
	}
	
	private Double calcTractiveEnergy()
	{
		//Calculate energy using when start "1.3464 mumgL/gear ratio"
		//mu = 0.55, g = 9.8 m/ss
		return (7.257096 * car.weight * wheel.getCmSize()) /  car.gearRatio
	}
	
	private int usageScoring()
	{
		def usageScore = UsageScore.findBySTypeAndUType(this.wheel.spoke,  this.usageType)
		return usageScore.score
	}
}
