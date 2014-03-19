package th.ac.chula.bsd.wheel



import grails.test.mixin.*
import spock.lang.*

@TestFor(ProductVendorTransferController)
@Mock(ProductVendorTransfer)
class ProductVendorTransferControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.productVendorTransferInstanceList
            model.productVendorTransferInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.productVendorTransferInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def productVendorTransfer = new ProductVendorTransfer()
            productVendorTransfer.validate()
            controller.save(productVendorTransfer)

        then:"The create view is rendered again with the correct model"
            model.productVendorTransferInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            productVendorTransfer = new ProductVendorTransfer(params)

            controller.save(productVendorTransfer)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/productVendorTransfer/show/1'
            controller.flash.message != null
            ProductVendorTransfer.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def productVendorTransfer = new ProductVendorTransfer(params)
            controller.show(productVendorTransfer)

        then:"A model is populated containing the domain instance"
            model.productVendorTransferInstance == productVendorTransfer
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def productVendorTransfer = new ProductVendorTransfer(params)
            controller.edit(productVendorTransfer)

        then:"A model is populated containing the domain instance"
            model.productVendorTransferInstance == productVendorTransfer
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/productVendorTransfer/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def productVendorTransfer = new ProductVendorTransfer()
            productVendorTransfer.validate()
            controller.update(productVendorTransfer)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.productVendorTransferInstance == productVendorTransfer

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            productVendorTransfer = new ProductVendorTransfer(params).save(flush: true)
            controller.update(productVendorTransfer)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/productVendorTransfer/show/$productVendorTransfer.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/productVendorTransfer/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def productVendorTransfer = new ProductVendorTransfer(params).save(flush: true)

        then:"It exists"
            ProductVendorTransfer.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(productVendorTransfer)

        then:"The instance is deleted"
            ProductVendorTransfer.count() == 0
            response.redirectedUrl == '/productVendorTransfer/index'
            flash.message != null
    }
}
