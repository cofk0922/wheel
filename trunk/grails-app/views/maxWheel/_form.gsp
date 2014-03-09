<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>



<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="maxWheel.prodName.label" default="Prod Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${maxWheelInstance?.prodName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'prodDesc', 'error')} ">
	<label for="prodDesc">
		<g:message code="maxWheel.prodDesc.label" default="Prod Desc" />
		
	</label>
	<g:textField name="prodDesc" value="${maxWheelInstance?.prodDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productPart', 'error')} ">
	<label for="productPart">
		<g:message code="maxWheel.productPart.label" default="Product Part" />
		
	</label>
	<g:select id="productPart" name="productPart.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" value="${maxWheelInstance?.productPart?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productPartAmount', 'error')} required">
	<label for="productPartAmount">
		<g:message code="maxWheel.productPartAmount.label" default="Product Part Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="productPartAmount" type="number" value="${maxWheelInstance.productPartAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'band', 'error')} required">
	<label for="band">
		<g:message code="maxWheel.band.label" default="Band" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="band" required="" value="${maxWheelInstance?.band}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'model', 'error')} required">
	<label for="model">
		<g:message code="maxWheel.model.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="model" required="" value="${maxWheelInstance?.model}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="maxWheel.size.label" default="Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="size" value="${fieldValue(bean: maxWheelInstance, field: 'size')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'width', 'error')} required">
	<label for="width">
		<g:message code="maxWheel.width.label" default="Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="width" value="${fieldValue(bean: maxWheelInstance, field: 'width')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="maxWheel.weight.label" default="Weight" />
		
	</label>
	<g:field name="weight" value="${fieldValue(bean: maxWheelInstance, field: 'weight')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'pcdCode', 'error')} ">
	<label for="pcdCode">
		<g:message code="maxWheel.pcdCode.label" default="Pcd Code" />
		
	</label>
	<g:textField name="pcdCode" value="${maxWheelInstance?.pcdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'offSet', 'error')} required">
	<label for="offSet">
		<g:message code="maxWheel.offSet.label" default="Off Set" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offSet" type="number" value="${maxWheelInstance.offSet}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productStocks', 'error')} ">
	<label for="productStocks">
		<g:message code="maxWheel.productStocks.label" default="Product Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelInstance?.productStocks?}" var="p">
    <li><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productStock" action="create" params="['maxWheel.id': maxWheelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productStock.label', default: 'ProductStock')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productType', 'error')} required">
	<label for="productType">
		<g:message code="maxWheel.productType.label" default="Product Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="productType" from="${th.ac.chula.bsd.wheel.ProductType?.values()}" keys="${th.ac.chula.bsd.wheel.ProductType.values()*.name()}" required="" value="${maxWheelInstance?.productType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productVendorTransfers', 'error')} ">
	<label for="productVendorTransfers">
		<g:message code="maxWheel.productVendorTransfers.label" default="Product Vendor Transfers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelInstance?.productVendorTransfers?}" var="p">
    <li><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productVendorTransfer" action="create" params="['maxWheel.id': maxWheelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'spoke', 'error')} required">
	<label for="spoke">
		<g:message code="maxWheel.spoke.label" default="Spoke" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="spoke" from="${th.ac.chula.bsd.wheel.SpokeType?.values()}" keys="${th.ac.chula.bsd.wheel.SpokeType.values()*.name()}" required="" value="${maxWheelInstance?.spoke?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'wheelLists', 'error')} ">
	<label for="wheelLists">
		<g:message code="maxWheel.wheelLists.label" default="Wheel Lists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelInstance?.wheelLists?}" var="w">
    <li><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carWheelList" action="create" params="['maxWheel.id': maxWheelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carWheelList.label', default: 'CarWheelList')])}</g:link>
</li>
</ul>

</div>

