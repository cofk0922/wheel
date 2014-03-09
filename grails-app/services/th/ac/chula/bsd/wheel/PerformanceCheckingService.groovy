package th.ac.chula.bsd.wheel

import grails.transaction.Transactional

@Transactional
class PerformanceCheckingService {

    def initialWheelListForNewCar(CarModel car) 
	{
		//get wheel where pcd = xxx and size < yy
		def query = MaxWheel.withCriteria{
			like("pcdCode", car.pcdCode)
			lt("size", car.defaultTireSize-10)
			}
		query.each {
			createCarWheelList(car, it)
		}
    }
	
	def initialWheelListForNewWheel(MaxWheel wheel)
	{
		//get car where
		//def matchCarList = Car.withCriteria()
		def query = CarModel.withCriteria {
			like("pcdCode", wheel.pcdCode)
			ge("defaultTireSize", wheel.size + 10)
			}
		query.each {
			createCarWheelList(it, wheel)
		}
	}
	
	def getWheelList(CarModel lCar, UsageType lUsageType, Branch lBranch)
	{
		//if carWheelList Where car = car and driveStar or energStar = 0 is avaliable recalculate all
		def scoredWheelList = []
		def query = CarWheelList.withCriteria {
			eq("car", lCar)
			eq("usageType", lUsageType)
			}
		query.each {
			createCarWheelList(it, wheel)
		}
		return scoredWheelList
	}
	
	public createCarWheelList(CarModel lCar, MaxWheel lWheel){
		//create for each usage type
		for(UsageType useType : UsageType.values()){
			def carWheel = new CarWheelList(lCar, lWheel, useType)
			carWheel.save()
		}
	}
}
