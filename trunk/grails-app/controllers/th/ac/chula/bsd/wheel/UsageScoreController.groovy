package th.ac.chula.bsd.wheel



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsageScoreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UsageScore.list(params), model:[usageScoreInstanceCount: UsageScore.count()]
    }

    def show(UsageScore usageScoreInstance) {
        respond usageScoreInstance
    }

    def create() {
        respond new UsageScore(params)
    }

    @Transactional
    def save(UsageScore usageScoreInstance) {
        if (usageScoreInstance == null) {
            notFound()
            return
        }

        if (usageScoreInstance.hasErrors()) {
            respond usageScoreInstance.errors, view:'create'
            return
        }

        usageScoreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usageScoreInstance.label', default: 'UsageScore'), ''])
                redirect usageScoreInstance
            }
            '*' { respond usageScoreInstance, [status: CREATED] }
        }
    }

    def edit(UsageScore usageScoreInstance) {
        respond usageScoreInstance
    }

    @Transactional
    def update(UsageScore usageScoreInstance) {
        if (usageScoreInstance == null) {
            notFound()
            return
        }

        if (usageScoreInstance.hasErrors()) {
            respond usageScoreInstance.errors, view:'edit'
            return
        }

        usageScoreInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UsageScore.label', default: 'UsageScore'), ''])
                redirect usageScoreInstance
            }
            '*'{ respond usageScoreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UsageScore usageScoreInstance) {

        if (usageScoreInstance == null) {
            notFound()
            return
        }

        usageScoreInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UsageScore.label', default: 'UsageScore'), ''])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usageScoreInstance.label', default: 'UsageScore'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
