package th.ac.chula.bsd.inventory



import grails.test.mixin.*
import spock.lang.*

@TestFor(PreProductTransferLineController)
@Mock(PreProductTransferLine)
class PreProductTransferLineControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.preProductTransferLineInstanceList
            model.preProductTransferLineInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.preProductTransferLineInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def preProductTransferLine = new PreProductTransferLine()
            preProductTransferLine.validate()
            controller.save(preProductTransferLine)

        then:"The create view is rendered again with the correct model"
            model.preProductTransferLineInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            preProductTransferLine = new PreProductTransferLine(params)

            controller.save(preProductTransferLine)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/preProductTransferLine/show/1'
            controller.flash.message != null
            PreProductTransferLine.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def preProductTransferLine = new PreProductTransferLine(params)
            controller.show(preProductTransferLine)

        then:"A model is populated containing the domain instance"
            model.preProductTransferLineInstance == preProductTransferLine
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def preProductTransferLine = new PreProductTransferLine(params)
            controller.edit(preProductTransferLine)

        then:"A model is populated containing the domain instance"
            model.preProductTransferLineInstance == preProductTransferLine
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/preProductTransferLine/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def preProductTransferLine = new PreProductTransferLine()
            preProductTransferLine.validate()
            controller.update(preProductTransferLine)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.preProductTransferLineInstance == preProductTransferLine

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            preProductTransferLine = new PreProductTransferLine(params).save(flush: true)
            controller.update(preProductTransferLine)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/preProductTransferLine/show/$preProductTransferLine.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/preProductTransferLine/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def preProductTransferLine = new PreProductTransferLine(params).save(flush: true)

        then:"It exists"
            PreProductTransferLine.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(preProductTransferLine)

        then:"The instance is deleted"
            PreProductTransferLine.count() == 0
            response.redirectedUrl == '/preProductTransferLine/index'
            flash.message != null
    }
}
