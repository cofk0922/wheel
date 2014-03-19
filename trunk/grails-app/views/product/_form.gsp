<%@ page import="th.ac.chula.bsd.wheel.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="product.prodName.label" default="Prod Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${productInstance?.prodName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'prodDesc', 'error')} ">
	<label for="prodDesc">
		<g:message code="product.prodDesc.label" default="Prod Desc" />
		
	</label>
	<g:textField name="prodDesc" value="${productInstance?.prodDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productPart', 'error')} ">
	<label for="productPart">
		<g:message code="product.productPart.label" default="Product Part" />
		
	</label>
	<g:select id="productPart" name="productPart.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" value="${productInstance?.productPart?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productPartAmount', 'error')} required">
	<label for="productPartAmount">
		<g:message code="product.productPartAmount.label" default="Product Part Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="productPartAmount" type="number" value="${productInstance.productPartAmount}" required=""/>
</div>

<%--
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productStocks', 'error')} ">
	<label for="productStocks">
		<g:message code="product.productStocks.label" default="Product Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productInstance?.productStocks?}" var="p">
    <li><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productStock" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productStock.label', default: 'ProductStock')])}</g:link>
</li>
</ul>

</div>
 --%>
 
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productType', 'error')} required">
	<label for="productType">
		<g:message code="product.productType.label" default="Product Type" />
		<span class="required-indicator">*</span>
	</label>
	<%--<g:select name="productType" from="${th.ac.chula.bsd.wheel.ProductType?.values()}" keys="${th.ac.chula.bsd.wheel.ProductType.values()*.name()}" required="" value="${productInstance?.productType?.name()}"/> --%>
	<g:select name="productType" from="${th.ac.chula.bsd.wheel.ProductTypeCreate?.values()}" keys="${th.ac.chula.bsd.wheel.ProductTypeCreate.values()*.name()}" required="" value="${params.prodType}"/>
</div>

<%--
<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productVendorTransfers', 'error')} ">
	<label for="productVendorTransfers">
		<g:message code="product.productVendorTransfers.label" default="Product Vendor Transfers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productInstance?.productVendorTransfers?}" var="p">
    <li><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productVendorTransfer" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')])}</g:link>
</li>
</ul>
</div>
 --%>

<div class="fieldcontain initialStock required">
	<label for="initialStock">
		<g:message code="product.initialStock.label" default="Initial Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="initialStock" type="number" required="" value="${params.initialStock}"/>
</div>

