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
		render(view:'inputWheel',model:parameter)
	}
	
	
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
		
		//grailsApplication.config.uploadFolder config in  cofig.groovy line 89
		
		def fullPath = grailsApplication.config.uploadFolder+carImage
		f.transferTo(new File(fullPath))
		//response.sendError(200, 'Done')
		flash.message = 'upload success !'
		
		
		parameter.carInstance = CarBand.get(params.bandName.toInteger())
		parameter.modelInstance = CarModel.get(params.modelId.toInteger())

		parameter.carImage = carImage
		
		render(view: "preview", model: parameter)
	}
	

	def detectImage() {	
		
		def parameter = [:]
		parameter.carImage = params.carImage		
		parameter.modelInstance = CarModel.get(params.modelId)
		
		render(view: "detectImage", model: parameter)
		
	}
	
	@Transactional
	def detectImageBack(){

		def modelInstance = CarModel.get(params.modelId)	
		modelInstance.properties = params
		
		
		
		modelInstance.properties.each{
			println it
			}
		
		def parameter = [:]
		parameter.carImage = params.carImage		
		parameter.modelInstance = modelInstance
		
		render(view: "detectImageBack", model: parameter)
	}
	
	
	
	def detectColor(){
		def modelInstance = CarModel.get(params.modelId)
		modelInstance.properties = params
		
		modelInstance.properties.each{
			println it
			}
		
		
		def parameter = [:]
		def fileSumPath = '../images/'+params.carImage
		
		parameter.carImage = fileSumPath
		parameter.modelInstance = modelInstance		
		render(view: "detectColor", model: parameter)
	}
	//@Transactional
	def saveCar(){
		def modelInstance = CarModel.get(params.modelId)
		
		println params
		modelInstance.properties = params
		
		modelInstance.properties.each{
			println it
			}
		//modelInstance.save(flush:true)
	}
	
	
	
	
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
	
	
	def imageInput(){
		return
	}
	
	

}
