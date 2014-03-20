package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarModelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarModel.list(params), model:[carModelInstanceCount: CarModel.count()]
    }

    def show(CarModel carModelInstance) {
        respond carModelInstance
    }

    def create() {
        respond new CarModel(params)
    }
	
	@Transactional
	def initialCarWheelList(CarModel carModelInstance, MaxWheel maxWheelInstance)
	{
		println("Match: ["+carModelInstance.modelName+"] with ["+maxWheelInstance.prodName+"]")
		def usageResult = UsageScore.withCriteria {
			eq('sType', maxWheelInstance.spoke)
			ne('score', 0)
		}
		if(usageResult.size() > 0){
			for(item in usageResult)
			{
				def carWheelList = new CarWheelList(carModelInstance, maxWheelInstance, item.uType, item.score)
				Boolean isSave = carWheelList.save flush:true
				 if (!isSave) {
					 carWheelList.errors.each {
						 println it
					 }
				 } else {
					 println ('Create PO Success : '+ carWheelList.car.modelName+" : "+carWheelList.wheel.prodName + " : "+carWheelList.usageScore)
				 }
			}
		}
	}
	
	def assignStar(CarModel carModelInstance, UsageType uType){
		//find mean
		//SD = root(sum((x-mean)^2)/N)
		def listResult = CarWheelList.withCriteria {
			eq('carModel', carModelInstance)
			eq('usageType', uType)
		}
		Float wCount = listResult.size()
		Float sumTractive = (Float)listResult.sum(tractiveEnergy)
		Float TractiveBar = sumTractive/wCount
		Float sumDrive = (Float)listResult.sum(drivingEnergy)
		Float DriveBar = sumDrive/wCount
		
		for (item in listResult){
			
		}
	}
	
	def initialWheelListForNewCar(CarModel carModelInstance){
		
		def wheelResult = MaxWheel.withCriteria {
			float cond1 = carModelInstance.defaultTireSize -10
//			float cond2 = offSet + carModelInstance.offSet
//			float cond3 = cond2 + 1
//			float cond4 = cond2 - 1
			eq('pcdCode', carModelInstance.pcdCode)
			le('size', cond1)
//			le('width'/2-'offSet', carModelInstance.offSet)
		}
		if(wheelResult.size() > 0){
			for (item in wheelResult) {
				println(item.band.name+item.prodName)
				initialCarWheelList(carModelInstance, item)
			}
		}
	}

    @Transactional
    def save(CarModel carModelInstance) {
        if (carModelInstance == null) {
            notFound()
            return
        }

        if (carModelInstance.hasErrors()) {
            respond carModelInstance.errors, view:'create'
            return
        }

        carModelInstance.save flush:true
		initialWheelListForNewCar(carModelInstance)

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carModelInstance.label', default: 'CarModel'), carModelInstance.modelName])
                redirect carModelInstance
            }
            '*' { respond carModelInstance, [status: CREATED] }
        }
    }

    def edit(CarModel carModelInstance) {
        respond carModelInstance
    }

    @Transactional
    def update(CarModel carModelInstance) {
        if (carModelInstance == null) {
            notFound()
            return
        }

        if (carModelInstance.hasErrors()) {
            respond carModelInstance.errors, view:'edit'
            return
        }

        carModelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CarModel.label', default: 'CarModel'), carModelInstance.modelName])
                redirect carModelInstance
            }
            '*'{ respond carModelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarModel carModelInstance) {

        if (carModelInstance == null) {
            notFound()
            return
        }

        carModelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarModel.label', default: 'CarModel'), carModelInstance.modelName])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carModelInstance.label', default: 'CarModel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
