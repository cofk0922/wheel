<%@ page import="th.ac.chula.bsd.wheel.ProductVendorTransfer" %>



<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="productVendorTransfer.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${[params.branch]}" optionKey="id" required="" value="${productVendorTransferInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productVendorTransfer.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${[params.product]}" optionKey="id" required="" value="${productVendorTransferInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'unitPrice', 'error')} required">
	<label for="unitPrice">
		<g:message code="productVendorTransfer.unitPrice.label" default="Unit Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="unitPrice" type="number" value="${fieldValue(bean: productVendorTransferInstance, field: 'unitPrice')}" required="" step="any" />
	<g:message code="default.THB" />
</div>
<br />
<hr />
<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'vendor', 'error')} required">
	<label for="vendor">
		<g:message code="productVendorTransfer.vendor.label" default="Vendor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendor" name="vendor.id" from="${params.vendorList}" optionKey="id" required="" value="${productVendorTransferInstance?.vendor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'transferDay', 'error')} required">
	<label for="transferDay">
		<g:message code="productVendorTransfer.transferDay.label" default="Transfer Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="transferDay" type="number" value="${productVendorTransferInstance.transferDay}" required=""/>
	<g:message code="default.day" />
</div>

<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'transferHour', 'error')} required">
	<label for="transferHour">
		<g:message code="productVendorTransfer.transferHour.label" default="Transfer Hour" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="transferHour" type="number" value="${productVendorTransferInstance.transferHour}" required=""/>
	<g:message code="default.hour" />
</div>

<div class="fieldcontain ${hasErrors(bean: productVendorTransferInstance, field: 'transferMinute', 'error')} required">
	<label for="transferMinute">
		<g:message code="productVendorTransfer.transferMinute.label" default="Transfer Minute" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="transferMinute" type="number" value="${productVendorTransferInstance.transferMinute}" required=""/>
	<g:message code="default.minute" />
</div>
