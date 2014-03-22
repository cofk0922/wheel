<%@ page import="th.ac.chula.bsd.inventory.ProductPurchase" %>



<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="productPurchase.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${productPurchaseInstance?.createdDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'updatedDate', 'error')} required">
	<label for="updatedDate">
		<g:message code="productPurchase.updatedDate.label" default="Updated Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedDate" precision="day"  value="${productPurchaseInstance?.updatedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'arrivalDate', 'error')} required">
	<label for="arrivalDate">
		<g:message code="productPurchase.arrivalDate.label" default="Arrival Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="arrivalDate" precision="day"  value="${productPurchaseInstance?.arrivalDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="productPurchase.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${productPurchaseInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="productPurchase.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${productPurchaseInstance?.createdBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'paymentType', 'error')} required">
	<label for="paymentType">
		<g:message code="productPurchase.paymentType.label" default="Payment Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="paymentType" name="paymentType.id" from="${th.ac.chula.bsd.inventory.PurchasePaymentType.list()}" optionKey="id" required="" value="${productPurchaseInstance?.paymentType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'purchaseDate', 'error')} required">
	<label for="purchaseDate">
		<g:message code="productPurchase.purchaseDate.label" default="Purchase Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="purchaseDate" precision="day"  value="${productPurchaseInstance?.purchaseDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'purchaseID', 'error')} ">
	<label for="purchaseID">
		<g:message code="productPurchase.purchaseID.label" default="Purchase ID" />
		
	</label>
	<g:textField name="purchaseID" value="${productPurchaseInstance?.purchaseID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'purchaseLines', 'error')} ">
	<label for="purchaseLines">
		<g:message code="productPurchase.purchaseLines.label" default="Purchase Lines" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productPurchaseInstance?.purchaseLines?}" var="p">
    <li><g:link controller="productPurchaseLine" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productPurchaseLine" action="create" params="['productPurchase.id': productPurchaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productPurchaseLine.label', default: 'ProductPurchaseLine')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'receivePurchases', 'error')} ">
	<label for="receivePurchases">
		<g:message code="productPurchase.receivePurchases.label" default="Receive Purchases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productPurchaseInstance?.receivePurchases?}" var="r">
    <li><g:link controller="receivePurchase" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="receivePurchase" action="create" params="['productPurchase.id': productPurchaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'receivePurchase.label', default: 'ReceivePurchase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="productPurchase.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${th.ac.chula.bsd.inventory.ProductPurchaseStatus?.values()}" keys="${th.ac.chula.bsd.inventory.ProductPurchaseStatus.values()*.name()}" required="" value="${productPurchaseInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'totalPrice', 'error')} required">
	<label for="totalPrice">
		<g:message code="productPurchase.totalPrice.label" default="Total Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPrice" value="${fieldValue(bean: productPurchaseInstance, field: 'totalPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'updatedBy', 'error')} required">
	<label for="updatedBy">
		<g:message code="productPurchase.updatedBy.label" default="Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="updatedBy" name="updatedBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${productPurchaseInstance?.updatedBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'vat', 'error')} required">
	<label for="vat">
		<g:message code="productPurchase.vat.label" default="Vat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="vat" value="${fieldValue(bean: productPurchaseInstance, field: 'vat')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPurchaseInstance, field: 'vendor', 'error')} required">
	<label for="vendor">
		<g:message code="productPurchase.vendor.label" default="Vendor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendor" name="vendor.id" from="${th.ac.chula.bsd.wheel.Vendor.list()}" optionKey="id" required="" value="${productPurchaseInstance?.vendor?.id}" class="many-to-one"/>
</div>

