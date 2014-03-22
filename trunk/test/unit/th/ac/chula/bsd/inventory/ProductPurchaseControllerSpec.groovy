package th.ac.chula.bsd.inventory



import grails.test.mixin.*
import spock.lang.*

@TestFor(ProductPurchaseController)
@Mock(ProductPurchase)
class ProductPurchaseControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.productPurchaseInstanceList
            model.productPurchaseInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.productPurchaseInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def productPurchase = new ProductPurchase()
            productPurchase.validate()
            controller.save(productPurchase)

        then:"The create view is rendered again with the correct model"
            model.productPurchaseInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            productPurchase = new ProductPurchase(params)

            controller.save(productPurchase)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/productPurchase/show/1'
            controller.flash.message != null
            ProductPurchase.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def productPurchase = new ProductPurchase(params)
            controller.show(productPurchase)

        then:"A model is populated containing the domain instance"
            model.productPurchaseInstance == productPurchase
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def productPurchase = new ProductPurchase(params)
            controller.edit(productPurchase)

        then:"A model is populated containing the domain instance"
            model.productPurchaseInstance == productPurchase
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/productPurchase/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def productPurchase = new ProductPurchase()
            productPurchase.validate()
            controller.update(productPurchase)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.productPurchaseInstance == productPurchase

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            productPurchase = new ProductPurchase(params).save(flush: true)
            controller.update(productPurchase)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/productPurchase/show/$productPurchase.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/productPurchase/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def productPurchase = new ProductPurchase(params).save(flush: true)

        then:"It exists"
            ProductPurchase.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(productPurchase)

        then:"The instance is deleted"
            ProductPurchase.count() == 0
            response.redirectedUrl == '/productPurchase/index'
            flash.message != null
    }
}
