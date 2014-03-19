<%@ page import="th.ac.chula.bsd.wheel.Nut" %>



<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'prodName', 'error')} required">
	<label for="prodName">
		<g:message code="nut.prodName.label" default="ชื่อเกลียวน๊อต" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prodName" required="" value="${nutInstance?.prodName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'prodDesc', 'error')} ">
	<label for="prodDesc">
		<g:message code="nut.prodDesc.label" default="รายละเอียด" />
		
	</label>
	<g:textField name="prodDesc" value="${nutInstance?.prodDesc}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'productPart', 'error')} ">
	<label for="productPart">
		<g:message code="nut.productPart.label" default="Product Part" />
		
	</label>
	<g:select id="productPart" name="productPart.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" value="${nutInstance?.productPart?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'productPartAmount', 'error')} required">
	<label for="productPartAmount">
		<g:message code="nut.productPartAmount.label" default="Product Part Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="productPartAmount" type="number" value="${nutInstance.productPartAmount}" required=""/>
</div>
 --%>
<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'nutSize', 'error')} required">
	<label for="nutSize">
		<g:message code="nut.nutSize.label" default="ขนาดเกลียวน๊อต(มิลลิเมตร)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nutSize" value="${fieldValue(bean: nutInstance, field: 'nutSize')}" required=""/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'productStocks', 'error')} ">
	<label for="productStocks">
		<g:message code="nut.productStocks.label" default="Product Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${nutInstance?.productStocks?}" var="p">
    <li><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productStock" action="create" params="['nut.id': nutInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productStock.label', default: 'ProductStock')])}</g:link>
</li>
</ul>

</div> 

<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'productType', 'error')} required">
	<label for="productType">
		<g:message code="nut.productType.label" default="Product Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="productType" from="${th.ac.chula.bsd.wheel.ProductType?.values()}" keys="${th.ac.chula.bsd.wheel.ProductType.values()*.name()}" required="" value="${nutInstance?.productType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutInstance, field: 'productVendorTransfers', 'error')} ">
	<label for="productVendorTransfers">
		<g:message code="nut.productVendorTransfers.label" default="Product Vendor Transfers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${nutInstance?.productVendorTransfers?}" var="p">
    <li><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productVendorTransfer" action="create" params="['nut.id': nutInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')])}</g:link>
</li>
</ul>

</div>--%>

