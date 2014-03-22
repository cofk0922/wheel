<%@ page import="th.ac.chula.bsd.inventory.PreProductPurchaseLine" %>



<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="preProductPurchaseLine.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" required="" value="${preProductPurchaseLineInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="preProductPurchaseLine.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${preProductPurchaseLineInstance?.createdDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'updatedDate', 'error')} required">
	<label for="updatedDate">
		<g:message code="preProductPurchaseLine.updatedDate.label" default="Updated Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedDate" precision="day"  value="${preProductPurchaseLineInstance?.updatedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="preProductPurchaseLine.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${preProductPurchaseLineInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'appointment', 'error')} required">
	<label for="appointment">
		<g:message code="preProductPurchaseLine.appointment.label" default="Appointment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="appointment" name="appointment.id" from="${th.ac.chula.bsd.wheel.Appointment.list()}" optionKey="id" required="" value="${preProductPurchaseLineInstance?.appointment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="preProductPurchaseLine.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${preProductPurchaseLineInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="preProductPurchaseLine.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${preProductPurchaseLineInstance?.createdBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="preProductPurchaseLine.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${th.ac.chula.bsd.inventory.PreProductPurchaseStatus?.values()}" keys="${th.ac.chula.bsd.inventory.PreProductPurchaseStatus.values()*.name()}" required="" value="${preProductPurchaseLineInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductPurchaseLineInstance, field: 'updatedBy', 'error')} required">
	<label for="updatedBy">
		<g:message code="preProductPurchaseLine.updatedBy.label" default="Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="updatedBy" name="updatedBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${preProductPurchaseLineInstance?.updatedBy?.id}" class="many-to-one"/>
</div>

