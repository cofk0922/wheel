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
		println("Match: ["+carModelInstance.modelName+"] with ["+maxWheelInstance.series+"]")
		def usageResult = UsageScore.withCriteria {
			eq('sType', maxWheelInstance.spoke)
			ne('score', 0)
		}
		if(usageResult.size() > 0){
			for(item in usageResult)
			{
				def carWheelList = new CarWheelList(carModelInstance, maxWheelInstance, item.uType)
				assignStar(carModelInstance)
				Boolean isSave = carWheelList.save flush:true
				 if (!isSave) {
					 carWheelList.errors.each {
						 println ("Error: "+it)
					 }
				 } else {
					 carModelInstance.wheelLists.add(carWheelList)
					 carModelInstance.save(flush:true)
					 //println ("Create carWheelList Success : "+ carWheelList.car.modelName+" : "+carWheelList.wheel.series + " : "+carWheelList.usageScore)
				 }
			}
		}
	}
	
	
	
	def initialWheelListForNewCar(CarModel carModelInstance){
		
		//Use criteria to select wheel that possible to mount with car's axle
		def wheelResult = MaxWheel.withCriteria {
			float cond1 = carModelInstance.defaultWheel.size+2
			eq('pcdCode', carModelInstance.pcdCode)
			and{
				ge('size', carModelInstance.defaultWheel.size)
				le('size', cond1)
			}
		}
		if(wheelResult.size() > 0){
			for (item in wheelResult) {
				//fetch and put suited wheel into CarWheelList
				//println("initialWheelListForNewCar : "+item.band.name+item.series+" : "+carModelInstance.band.bandName+carModelInstance.modelName)
				
				//Mention Width :maxWheel.width and carModel.defaultWheel.width
				if(Math.abs(item.width-carModelInstance.defaultWheel.width)<=2){
					//Mention Space for offset: maxWheel.width maxWheel.offset and carModel.defaultWheel.width carModel.defaultWheel.offset
					def defaultWideSpace = (carModelInstance.defaultWheel.width/2)-carModelInstance.defaultWheel.getInchOffSet()
					def itemWideSpace = (item.width/2)-item.getInchOffSet()
					if(Math.abs(defaultWideSpace-itemWideSpace)<=2){
						//if wheel condition is OK create CarWheelList object
						initialCarWheelList(carModelInstance, item)
						println("- : Add to List")
					}
					else{
						println("- : Not in offset condition")
					}
				}
				else{
					println("- : Not in width condition")
				}
				
			}
		}
	}
	
	@Transactional
	def assignStar(CarModel carModelInstance){
		//for each CarWheelList call setDriveStar and setTractiveStar
		def allWheelLists = carModelInstance.wheelLists
		for (wheelListInstance in allWheelLists){
			wheelListInstance.setDriveStar();
			wheelListInstance.setTractiveStar();
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
		assignStar(carModelInstance)

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
