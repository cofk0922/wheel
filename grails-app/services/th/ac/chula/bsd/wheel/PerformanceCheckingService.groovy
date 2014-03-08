package th.ac.chula.bsd.wheel

import grails.transaction.Transactional

@Transactional
class PerformanceCheckingService {

    def initialWheelListForNewCar(Car car) 
	{
		//get wheel where pcd = xxx and size < yy
		def matchWheelList = MaxWheel.findAllByPcdCodeAndSize(car.pcdCode,car.wheelSpace)
		matchWheelList.each {
			def carWheel = new CarWheelList(car, it)
			carWheel.save()
		}
    }
	
	def initialWheelListForNewWheel(MaxWheel wheel)
	{
		//get car where
		//def matchCarList = Car.where()
	}
}
