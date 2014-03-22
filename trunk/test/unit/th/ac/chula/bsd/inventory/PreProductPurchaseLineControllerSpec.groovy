package th.ac.chula.bsd.inventory



import grails.test.mixin.*
import spock.lang.*

@TestFor(PreProductPurchaseLineController)
@Mock(PreProductPurchaseLine)
class PreProductPurchaseLineControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.preProductPurchaseLineInstanceList
            model.preProductPurchaseLineInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.preProductPurchaseLineInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def preProductPurchaseLine = new PreProductPurchaseLine()
            preProductPurchaseLine.validate()
            controller.save(preProductPurchaseLine)

        then:"The create view is rendered again with the correct model"
            model.preProductPurchaseLineInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            preProductPurchaseLine = new PreProductPurchaseLine(params)

            controller.save(preProductPurchaseLine)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/preProductPurchaseLine/show/1'
            controller.flash.message != null
            PreProductPurchaseLine.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def preProductPurchaseLine = new PreProductPurchaseLine(params)
            controller.show(preProductPurchaseLine)

        then:"A model is populated containing the domain instance"
            model.preProductPurchaseLineInstance == preProductPurchaseLine
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def preProductPurchaseLine = new PreProductPurchaseLine(params)
            controller.edit(preProductPurchaseLine)

        then:"A model is populated containing the domain instance"
            model.preProductPurchaseLineInstance == preProductPurchaseLine
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/preProductPurchaseLine/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def preProductPurchaseLine = new PreProductPurchaseLine()
            preProductPurchaseLine.validate()
            controller.update(preProductPurchaseLine)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.preProductPurchaseLineInstance == preProductPurchaseLine

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            preProductPurchaseLine = new PreProductPurchaseLine(params).save(flush: true)
            controller.update(preProductPurchaseLine)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/preProductPurchaseLine/show/$preProductPurchaseLine.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/preProductPurchaseLine/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def preProductPurchaseLine = new PreProductPurchaseLine(params).save(flush: true)

        then:"It exists"
            PreProductPurchaseLine.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(preProductPurchaseLine)

        then:"The instance is deleted"
            PreProductPurchaseLine.count() == 0
            response.redirectedUrl == '/preProductPurchaseLine/index'
            flash.message != null
    }
}
