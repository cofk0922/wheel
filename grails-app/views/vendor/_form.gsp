<%@ page import="th.ac.chula.bsd.wheel.Vendor" %>



<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'vendorName', 'error')} required">
	<label for="vendorName">
		<g:message code="vendor.vendorName.label" default="Vendor Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vendorName" required="" value="${vendorInstance?.vendorName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'vendorAddress', 'error')} required">
	<label for="vendorAddress">
		<g:message code="vendor.vendorAddress.label" default="Vendor Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vendorAddress" required="" value="${vendorInstance?.vendorAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendorInstance, field: 'productVendors', 'error')} ">
	<label for="productVendors">
		<g:message code="vendor.productVendors.label" default="Product Vendors" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vendorInstance?.productVendors?}" var="p">
    <li><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productVendorTransfer" action="create" params="['vendor.id': vendorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')])}</g:link>
</li>
</ul>

</div>

