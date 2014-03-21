package th.ac.chula.bsd.wheel

import java.util.Set;

class CarModel {
	
	String modelName
	int year
	String pcdCode
	Float offSet
	Float weight
	Float gearRatio
	MaxWheel defaultWheel
	int defaultTireSize
	float nutSize
	
//	Set wheelList = []
	static hasMany = [wheelLists: CarWheelList, carColor: CarColor]
	
	static hasOne = [band: CarBand]
	
	static constraints = {
		defaultWheel nullable: false
	}
	
	String toString() {
		return this.modelName
	}
	
	
	public double getMeanDrivingEnergy(UsageType inputUsageType){
		double sumEnergy
		double meanValue = 0
		def usgWheelList = this.wheelLists.find{it.usageType == inputUsageType}
		if(usgWheelList.size()>0){
			for(item in usgWheelList){
				sumEnergy += item.drivingEnergy
			}
			meanValue = sumEnergy/usgWheelList.size()
		}
		println(inputUsageType+" mean : "+meanValue)
		return meanValue
	}
	
	public double getStdevDrivingEnergy(UsageType inputUsageType){
		double powerSum2
		double meanEnergy = getMeanDrivingEnergy(inputUsageType)
		double stdev = 0
		def usgWheelList = this.wheelLists.find{it.usageType == inputUsageType}
		if(usgWheelList.size()>0){
			for(item in usgWheelList){
				powerSum2 += Math.pow(item.drivingEnergy-meanEnergy, 2)
			}
			stdev = Math.sqrt(powerSum2/usgWheelList.size());
		}
		println(inputUsageType+" SD : "+stdev)
		return stdev
	}
	
	public double getMeanTractiveEnergy(UsageType inputUsageType){
		double sumEnergy
		double meanValue = 0
		def usgWheelList = this.wheelLists.find{it.usageType == inputUsageType}
		if(usgWheelList.size()>0){
			for(item in usgWheelList){
				sumEnergy += item.tractiveEnergy
			}
			meanValue = sumEnergy/usgWheelList.size()
		}
		println(inputUsageType+" mean : "+meanValue)
		return meanValue
	}
	
	public double getStdevTractiveEnergy(UsageType inputUsageType){
		double powerSum2
		double meanEnergy = getMeanTractiveEnergy(inputUsageType)
		double stdev = 0
		def usgWheelList = this.wheelLists.find{it.usageType == inputUsageType}
		if(usgWheelList.size()>0){
			for(item in usgWheelList){
				powerSum2 += Math.pow(item.tractiveEnergy-meanEnergy, 2)
			}
			stdev = Math.sqrt(powerSum2/usgWheelList.size());
		}
		println(inputUsageType+" SD : "+stdev)
		return stdev
	}

}
