<%@ page import="th.ac.chula.bsd.inventory.PreProductTransferLine" %>



<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="preProductTransferLine.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" required="" value="${preProductTransferLineInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="preProductTransferLine.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${preProductTransferLineInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="preProductTransferLine.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${preProductTransferLineInstance?.createdDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'updatedDate', 'error')} required">
	<label for="updatedDate">
		<g:message code="preProductTransferLine.updatedDate.label" default="Updated Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedDate" precision="day"  value="${preProductTransferLineInstance?.updatedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'appointment', 'error')} required">
	<label for="appointment">
		<g:message code="preProductTransferLine.appointment.label" default="Appointment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="appointment" name="appointment.id" from="${th.ac.chula.bsd.wheel.Appointment.list()}" optionKey="id" required="" value="${preProductTransferLineInstance?.appointment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="preProductTransferLine.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${preProductTransferLineInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="preProductTransferLine.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${preProductTransferLineInstance?.createdBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'productTransferLines', 'error')} ">
	<label for="productTransferLines">
		<g:message code="preProductTransferLine.productTransferLines.label" default="Product Transfer Lines" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${preProductTransferLineInstance?.productTransferLines?}" var="p">
    <li><g:link controller="productTransferLine" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productTransferLine" action="create" params="['preProductTransferLine.id': preProductTransferLineInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productTransferLine.label', default: 'ProductTransferLine')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="preProductTransferLine.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${th.ac.chula.bsd.inventory.PreProductTransferStatus?.values()}" keys="${th.ac.chula.bsd.inventory.PreProductTransferStatus.values()*.name()}" required="" value="${preProductTransferLineInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preProductTransferLineInstance, field: 'updatedBy', 'error')} required">
	<label for="updatedBy">
		<g:message code="preProductTransferLine.updatedBy.label" default="Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="updatedBy" name="updatedBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${preProductTransferLineInstance?.updatedBy?.id}" class="many-to-one"/>
</div>

