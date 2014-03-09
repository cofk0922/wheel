package th.ac.chula.bsd.wheel

import grails.transaction.Transactional

@Transactional
class PerformanceCheckingService {

    def initialWheelListForNewCar(CarModel car) 
	{
		//get wheel where pcd = xxx and size < yy
		def query = MaxWheel.where{pcdCode == car.pcdCode && size == car.wheelSpace}
		query.each {
			createCarWheelList(it, wheel)
		}
    }
	
	def initialWheelListForNewWheel(MaxWheel wheel)
	{
		//get car where
		//def matchCarList = Car.withCriteria()
		def query = CarModel.where {pcdCode == wheel.pcdCode && wheelSpace == wheel.size}
		query.each {
			createCarWheelList(it, wheel)
		}
	}
	
	def getWheelList(CarModel car, String usageType, Branch branch)
	{
		def scoredWheelList = []
		
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
