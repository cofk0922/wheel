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
	
	def inputWheel(){		
		def parameter = [:]
		
		def honda  = CarBand.get(1)
		def hondaIn =  new CarModel(model:'Civic Y2004 ',band:honda)
		
		if (!hondaIn.save()) {
			hondaIn.errors.each {
				println it
			}
		}
		
		parameter.listCarBand = CarBand.list()
		parameter.listCarModel = CarModel.list()
		render(view:'inputWheel',model:parameter)
	}
	
	
	def upload() {
		def parameter = [:]
		def fileCropName
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = 'file cannot be empty'
			render(view: 'inputWheel')
			return
		}
		def filename = f.originalFilename
		def fullPath = grailsApplication.config.uploadFolder+filename
		f.transferTo(new File(fullPath))
		//response.sendError(200, 'Done')
		flash.message = 'upload success !'
		
		parameter.fileCropName = fileCropName
		parameter.filename = filename
		render(view: "inputWheel", model: parameter)
	}
	
	
	def detectImage() {
		

		println params
		
		
		return
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
	
	def detectColor(){
		println params
		def fileCropName = '../images/'+params.fileCropName
		//def outputPath  = grailsApplication.config.uploadFolder+'crop/'+fileCropName
		//println "outputPath="+outputPath
		render(view: "detectColor", model: [fileCropName:fileCropName])
	}
	
	def imageInput(){
		return
	}
	
	
	def detectImageBack(){
		return
	}
}
