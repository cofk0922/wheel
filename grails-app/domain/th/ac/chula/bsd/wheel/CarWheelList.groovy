package th.ac.chula.bsd.wheel

import org.springframework.aop.aspectj.RuntimeTestWalker.ThisInstanceOfResidueTestVisitor;

class CarWheelList {
	
	Integer listOrder 
	Double drivingEnergy
	Double tractiveEnergy 
	Integer	driveStar 
	Integer tractiveStar 
	
	static hasOne = [
		
		]
	
	static belongsTo = [wheel: MaxWheel,car: Car]
	
    static constraints = {
    }
	
	public CarWheelList(Car lCar, MaxWheel lWheel)
	{
		this.car = lCar
		this.wheel = lWheel
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
}
