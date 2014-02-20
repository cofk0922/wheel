package th.ac.chula.bsd.wheel



import grails.test.mixin.*
import spock.lang.*

@TestFor(MaxWheelController)
@Mock(MaxWheel)
class MaxWheelControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.maxWheelInstanceList
            model.maxWheelInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.maxWheelInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def maxWheel = new MaxWheel()
            maxWheel.validate()
            controller.save(maxWheel)

        then:"The create view is rendered again with the correct model"
            model.maxWheelInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            maxWheel = new MaxWheel(params)

            controller.save(maxWheel)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/maxWheel/show/1'
            controller.flash.message != null
            MaxWheel.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def maxWheel = new MaxWheel(params)
            controller.show(maxWheel)

        then:"A model is populated containing the domain instance"
            model.maxWheelInstance == maxWheel
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def maxWheel = new MaxWheel(params)
            controller.edit(maxWheel)

        then:"A model is populated containing the domain instance"
            model.maxWheelInstance == maxWheel
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/maxWheel/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def maxWheel = new MaxWheel()
            maxWheel.validate()
            controller.update(maxWheel)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.maxWheelInstance == maxWheel

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            maxWheel = new MaxWheel(params).save(flush: true)
            controller.update(maxWheel)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/maxWheel/show/$maxWheel.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/maxWheel/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def maxWheel = new MaxWheel(params).save(flush: true)

        then:"It exists"
            MaxWheel.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(maxWheel)

        then:"The instance is deleted"
            MaxWheel.count() == 0
            response.redirectedUrl == '/maxWheel/index'
            flash.message != null
    }
}
