package th.ac.chula.bsd.wheel



import grails.test.mixin.*
import spock.lang.*

@TestFor(InstallationController)
@Mock(Installation)
class InstallationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.installationInstanceList
            model.installationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.installationInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def installation = new Installation()
            installation.validate()
            controller.save(installation)

        then:"The create view is rendered again with the correct model"
            model.installationInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            installation = new Installation(params)

            controller.save(installation)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/installation/show/1'
            controller.flash.message != null
            Installation.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def installation = new Installation(params)
            controller.show(installation)

        then:"A model is populated containing the domain instance"
            model.installationInstance == installation
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def installation = new Installation(params)
            controller.edit(installation)

        then:"A model is populated containing the domain instance"
            model.installationInstance == installation
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/installation/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def installation = new Installation()
            installation.validate()
            controller.update(installation)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.installationInstance == installation

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            installation = new Installation(params).save(flush: true)
            controller.update(installation)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/installation/show/$installation.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/installation/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def installation = new Installation(params).save(flush: true)

        then:"It exists"
            Installation.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(installation)

        then:"The instance is deleted"
            Installation.count() == 0
            response.redirectedUrl == '/installation/index'
            flash.message != null
    }
}
