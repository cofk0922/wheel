package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MaxWheelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MaxWheel.list(params), model:[maxWheelInstanceCount: MaxWheel.count()]
    }

    def show(MaxWheel maxWheelInstance) {
        respond maxWheelInstance
    }

    def create() {
        respond new MaxWheel(params)
    }

    @Transactional
    def save(MaxWheel maxWheelInstance) {
		
		
		
        if (maxWheelInstance == null) {
            notFound()
            return
        }

        if (maxWheelInstance.hasErrors()) {
            respond maxWheelInstance.errors, view:'create'
            return
        }
		
		//TODO save Wheel
		maxWheelInstance.productType = ProductType.WHEEL
        maxWheelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maxWheelInstance.label', default: 'MaxWheel'), maxWheelInstance.id])
                redirect maxWheelInstance
            }
            '*' { respond maxWheelInstance, [status: CREATED] }
        }
    }

    def edit(MaxWheel maxWheelInstance) {
        respond maxWheelInstance
    }

    @Transactional
    def update(MaxWheel maxWheelInstance) {
        if (maxWheelInstance == null) {
            notFound()
            return
        }

        if (maxWheelInstance.hasErrors()) {
            respond maxWheelInstance.errors, view:'edit'
            return
        }

        maxWheelInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MaxWheel.label', default: 'MaxWheel'), maxWheelInstance.id])
                redirect maxWheelInstance
            }
            '*'{ respond maxWheelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MaxWheel maxWheelInstance) {

        if (maxWheelInstance == null) {
            notFound()
            return
        }

        maxWheelInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MaxWheel.label', default: 'MaxWheel'), maxWheelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maxWheelInstance.label', default: 'MaxWheel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Transactional
	def inputWheel(){		
		def parameter = [:]
		parameter.listCarBand = CarBand.list()
		parameter.listCarModel = CarModel.list()
		parameter.listCarColor = CarColor.list()
		render(view:'inputWheel',model:parameter)
	}
	
	@Transactional
	def selectCarModel(){
		def selectedBand = CarBand.get(params.bandId)
		def parameter = [:]
		parameter.listCarModel = CarModel.findByBand(selectedBand)
		render(view:'inputWheel',model:parameter)
	}
	
	@Transactional
	def preview() {
		
		
		def parameter = [:]
		def fileCropName
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'inputWheel')
			return
		}
		def carImage = f.originalFilename
		
		//grailsApplication.config.uploadFolder is Define Path image in local config in  cofig.groovy line 89
		
		def fullPath = grailsApplication.config.uploadFolder+carImage
		f.transferTo(new File(fullPath))
		//response.sendError(200, 'Done')
		flash.message = 'upload success !'
		
		println carImage
		println params.modelId
		println params.colorId
		
		parameter.carImage = carImage
		parameter.modelInstance = CarModel.get(params.modelId.toLong())
		parameter.colorInstance = CarColor.get(params.colorId.toLong())
		
		render(view: "preview", model: parameter)
	}
	
	@Transactional
	def detectImage() {	
		
		println params.carImage
		println params.modelId
		
		def parameter = [:]
		parameter.carImage = params.carImage		
		parameter.modelInstance = CarModel.get(params.modelId.toLong())
		
		// Set Color
		println params.hVal
		println params.sVal
		println params.vVal
		println params.hexVal
		println params.colorName
		parameter.hVal = params.hVal
		parameter.sVal = params.sVal
		parameter.vVal = params.vVal
		parameter.hexVal = params.hexVal
		parameter.colorName = params.colorName
		
		render(view: "detectImage", model: parameter)
		
	}
	
	@Transactional
	def detectImageBack(){
		println params.carImage
		println params.modelId
		
		def parameter = [:]
		parameter.hVal = params.hVal
		parameter.sVal = params.sVal
		parameter.vVal = params.vVal
		parameter.hexVal = params.hexVal
		parameter.colorName = params.colorName
		parameter.carImage = params.carImage
		
		// Set Color
		println params.hVal
		println params.sVal
		println params.vVal
		println params.hexVal
		println params.colorName
		parameter.hVal = params.hVal
		parameter.sVal = params.sVal
		parameter.vVal = params.vVal
		parameter.hexVal = params.hexVal
		parameter.colorName = params.colorName
		
		// Set Front Wheel
		println params.frontX1
		println params.frontX2
		println params.frontY1
		println params.frontY2
		println params.frontHeight
		println params.frontWidth
		parameter.frontX1 = params.frontX1
		parameter.frontX2 = params.frontX2
		parameter.frontY1 = params.frontY1
		parameter.frontY2 = params.frontY2
		parameter.frontHeight = params.frontHeight
		parameter.frontWidth = params.frontWidth
		
		parameter.modelInstance = CarModel.get(params.modelId.toLong())
		
		render(view: "detectImageBack", model: parameter)
		
	}
	
	
	@Transactional
	def detectColor(){		
		
		def fileCropName
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'inputWheel')
			return
		}
		def carImage = f.originalFilename
		
		//grailsApplication.config.uploadFolder is Define Path image in local config in  cofig.groovy line 89
		
		def fullPath = grailsApplication.config.uploadFolder+carImage
		f.transferTo(new File(fullPath))
		//response.sendError(200, 'Done')
		flash.message = 'upload success !'
		
		println carImage
		
		println params.carImage
		println params.modelId
		println params.colorId
		
		def parameter = [:]
		def fileSumPath = '../images/'+carImage
		
		println fileSumPath
		parameter.carImage = fileSumPath
		parameter.modelInstance = CarModel.get(params.modelId.toLong())		
		render(view: "detectColor", model: parameter)
	}

    @Transactional
	def saveCarColor(){
		// get Model
		println params.modelId
		// get Image
		println params.carImage
		// Set Color
		println params.hVal
		println params.sVal
		println params.vVal
		println params.hexVal
		println params.colorName
		println params.frontX1
		println params.frontX2
		println params.frontY1
		println params.frontY2
		println params.frontHeight
		println params.frontWidth
		println params.backX1
		println params.backX2
		println params.backY1
		println params.backY2
		println params.backHeight
		println params.backWidth

		def carColorInstance = new CarColor(
			carModel:params.modelId,
			carImage:params.carImage,
			hVal:params.hVal,
			sVal:params.sVal,
			vVal:params.vVal,
			hexVal:params.hexVal,
			frontX1: params.frontX1,
			frontX2: params.frontX2,
			frontY1: params.frontY1,
			frontY2: params.frontY2,
			frontHeight: params.frontHeight,
			frontWidth: params.frontWidth,
			backX1: params.backX1,
			backX2: params.backX2,
			backY1: params.backY1,
			backY2: params.backY2,
			backHeight: params.backHeight,
			backWidth: params.backWidth,
			colorName: params.colorName
				)
        Boolean isSave = carColorInstance.save flush:true
		redirect(action:"inputWheel")
	}
	
	
	
@Transactional
	def cropingImage(){
		
		def parameter = [:]
		//def fileCropName = 'pool.jpg'
		def fileCropName = params.filename
		def fullPath = grailsApplication.config.uploadFolder+fileCropName
		def outputPath  = grailsApplication.config.uploadFolder+'crop'
		
		def x = params.x.toInteger()
		def y = params.y.toInteger()
		def w = params.w.toInteger()
		def h = params.h.toInteger()
		
		burningImageService.doWith(fullPath, outputPath)
				   .execute {
					   it.crop(x,y,w,h)
				 }
		parameter.fileCropName = fileCropName
		parameter.filename = params.filename
		render(view: "inputWheel", model: parameter)

	}
	
	@Transactional
	def selectedMaxWheel(CarModel carModelInstance, UsageType usageType, Branch branch){
		//Send max wheel list for specific car
		def parameter = [:]
		def carWheelList = CarWheelList.withCriteria{
			eq('car', carModelInstance)
			and{
				eq('usageType', usageType)
			}
		}
		def selectedCarWheelList = []
		for(item in carWheelList){
			if(item.wheel.getProductStock(branch)>0)
			selectedCarWheelList.add(item)
		}
		parameter.selectedWheelList =
		render(view:'inputWheel',model:parameter)
	}
	
	@Transactional
	def imageInput(){
		return
	}
	
	def  addWheel(){
		
		
		
		
		return
	}
}
