<%@ page import="th.ac.chula.bsd.wheel.MaxWheelColor" %>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'productType', 'error')} required">
	<label for="productType">
		<g:message code="maxWheelColor.productType.label" default="Product Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="productType" from="${[params.prodType]}" keys="${th.ac.chula.bsd.wheel.ProductType.values()*.name()}" required="" value="${maxWheelColorInstance?.productType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="maxWheelColor.prodName.label" default="Prod Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${maxWheelColorInstance?.prodName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'prodDesc', 'error')} ">
	<label for="prodDesc">
		<g:message code="maxWheelColor.prodDesc.label" default="Prod Desc" />
		
	</label>
	<g:textField name="prodDesc" value="${maxWheelColorInstance?.prodDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'productPart', 'error')} ">
	<label for="productPart">
		<g:message code="maxWheelColor.productPart.label" default="Product Part" />
		
	</label>
	<g:select id="productPart" name="productPart.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" value="${maxWheelColorInstance?.productPart?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'productPartAmount', 'error')} required">
	<label for="productPartAmount">
		<g:message code="maxWheelColor.productPartAmount.label" default="Product Part Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="productPartAmount" type="number" value="${maxWheelColorInstance.productPartAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'colorName', 'error')} ">
	<label for="colorName">
		<g:message code="maxWheelColor.colorName.label" default="Color Name" />
		
	</label>
	<g:textField name="colorName" value="${maxWheelColorInstance?.colorName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'hVal', 'error')} ">
	<label for="hVal">
		<g:message code="maxWheelColor.hVal.label" default="HV al" />
		
	</label>
	<g:textField name="hVal" value="${maxWheelColorInstance?.hVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'hexVal', 'error')} ">
	<label for="hexVal">
		<g:message code="maxWheelColor.hexVal.label" default="Hex Val" />
		
	</label>
	<g:textField name="hexVal" value="${maxWheelColorInstance?.hexVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'maxWheel', 'error')} required">
	<label for="maxWheel">
		<g:message code="maxWheelColor.maxWheel.label" default="Max Wheel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="maxWheel" name="maxWheel.id" from="${th.ac.chula.bsd.wheel.MaxWheel.list()}" optionKey="id" required="" value="${maxWheelColorInstance?.maxWheel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'productStocks', 'error')} ">
	<label for="productStocks">
		<g:message code="maxWheelColor.productStocks.label" default="Product Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelColorInstance?.productStocks?}" var="p">
    <li><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productStock" action="create" params="['maxWheelColor.id': maxWheelColorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productStock.label', default: 'ProductStock')])}</g:link>
</li>
</ul>

</div>


<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'productVendorTransfers', 'error')} ">
	<label for="productVendorTransfers">
		<g:message code="maxWheelColor.productVendorTransfers.label" default="Product Vendor Transfers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelColorInstance?.productVendorTransfers?}" var="p">
    <li><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productVendorTransfer" action="create" params="['maxWheelColor.id': maxWheelColorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'sVal', 'error')} ">
	<label for="sVal">
		<g:message code="maxWheelColor.sVal.label" default="SV al" />
		
	</label>
	<g:textField name="sVal" value="${maxWheelColorInstance?.sVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'vVal', 'error')} ">
	<label for="vVal">
		<g:message code="maxWheelColor.vVal.label" default="VV al" />
		
	</label>
	<g:textField name="vVal" value="${maxWheelColorInstance?.vVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelColorInstance, field: 'wheelImage', 'error')} ">
	<label for="wheelImage">
		<g:message code="maxWheelColor.wheelImage.label" default="Wheel Image" />
		
	</label>
	<g:textField name="wheelImage" value="${maxWheelColorInstance?.wheelImage}"/>
</div>

