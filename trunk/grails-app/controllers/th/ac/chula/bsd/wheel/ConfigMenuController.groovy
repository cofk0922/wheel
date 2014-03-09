package th.ac.chula.bsd.wheel

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ConfigMenuController {
	
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() { }
}
