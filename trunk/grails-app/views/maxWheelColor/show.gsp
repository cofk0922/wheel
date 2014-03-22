
<%@ page import="th.ac.chula.bsd.wheel.MaxWheelColor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maxWheelColor.label', default: 'MaxWheelColor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-maxWheelColor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-maxWheelColor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maxWheelColor">
			
				<g:if test="${maxWheelColorInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="maxWheelColor.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${maxWheelColorInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.prodDesc}">
				<li class="fieldcontain">
					<span id="prodDesc-label" class="property-label"><g:message code="maxWheelColor.prodDesc.label" default="Prod Desc" /></span>
					
						<span class="property-value" aria-labelledby="prodDesc-label"><g:fieldValue bean="${maxWheelColorInstance}" field="prodDesc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.productPart}">
				<li class="fieldcontain">
					<span id="productPart-label" class="property-label"><g:message code="maxWheelColor.productPart.label" default="Product Part" /></span>
					
						<span class="property-value" aria-labelledby="productPart-label"><g:link controller="product" action="show" id="${maxWheelColorInstance?.productPart?.id}">${maxWheelColorInstance?.productPart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.productPartAmount}">
				<li class="fieldcontain">
					<span id="productPartAmount-label" class="property-label"><g:message code="maxWheelColor.productPartAmount.label" default="Product Part Amount" /></span>
					
						<span class="property-value" aria-labelledby="productPartAmount-label"><g:fieldValue bean="${maxWheelColorInstance}" field="productPartAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.colorName}">
				<li class="fieldcontain">
					<span id="colorName-label" class="property-label"><g:message code="maxWheelColor.colorName.label" default="Color Name" /></span>
					
						<span class="property-value" aria-labelledby="colorName-label"><g:fieldValue bean="${maxWheelColorInstance}" field="colorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.hVal}">
				<li class="fieldcontain">
					<span id="hVal-label" class="property-label"><g:message code="maxWheelColor.hVal.label" default="HV al" /></span>
					
						<span class="property-value" aria-labelledby="hVal-label"><g:fieldValue bean="${maxWheelColorInstance}" field="hVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.hexVal}">
				<li class="fieldcontain">
					<span id="hexVal-label" class="property-label"><g:message code="maxWheelColor.hexVal.label" default="Hex Val" /></span>
					
						<span class="property-value" aria-labelledby="hexVal-label"><g:fieldValue bean="${maxWheelColorInstance}" field="hexVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.maxWheel}">
				<li class="fieldcontain">
					<span id="maxWheel-label" class="property-label"><g:message code="maxWheelColor.maxWheel.label" default="Max Wheel" /></span>
					
						<span class="property-value" aria-labelledby="maxWheel-label"><g:link controller="maxWheel" action="show" id="${maxWheelColorInstance?.maxWheel?.id}">${maxWheelColorInstance?.maxWheel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.productStocks}">
				<li class="fieldcontain">
					<span id="productStocks-label" class="property-label"><g:message code="maxWheelColor.productStocks.label" default="Product Stocks" /></span>
					
						<g:each in="${maxWheelColorInstance.productStocks}" var="p">
						<span class="property-value" aria-labelledby="productStocks-label"><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.productType}">
				<li class="fieldcontain">
					<span id="productType-label" class="property-label"><g:message code="maxWheelColor.productType.label" default="Product Type" /></span>
					
						<span class="property-value" aria-labelledby="productType-label"><g:fieldValue bean="${maxWheelColorInstance}" field="productType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.productVendorTransfers}">
				<li class="fieldcontain">
					<span id="productVendorTransfers-label" class="property-label"><g:message code="maxWheelColor.productVendorTransfers.label" default="Product Vendor Transfers" /></span>
					
						<g:each in="${maxWheelColorInstance.productVendorTransfers}" var="p">
						<span class="property-value" aria-labelledby="productVendorTransfers-label"><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.sVal}">
				<li class="fieldcontain">
					<span id="sVal-label" class="property-label"><g:message code="maxWheelColor.sVal.label" default="SV al" /></span>
					
						<span class="property-value" aria-labelledby="sVal-label"><g:fieldValue bean="${maxWheelColorInstance}" field="sVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.vVal}">
				<li class="fieldcontain">
					<span id="vVal-label" class="property-label"><g:message code="maxWheelColor.vVal.label" default="VV al" /></span>
					
						<span class="property-value" aria-labelledby="vVal-label"><g:fieldValue bean="${maxWheelColorInstance}" field="vVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelColorInstance?.wheelImage}">
				<li class="fieldcontain">
					<span id="wheelImage-label" class="property-label"><g:message code="maxWheelColor.wheelImage.label" default="Wheel Image" /></span>
					
						<span class="property-value" aria-labelledby="wheelImage-label"><g:fieldValue bean="${maxWheelColorInstance}" field="wheelImage"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:maxWheelColorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="list" action="index" controller="productVendorTransfer" params="${[prodID:maxWheelColorInstance.id, prodType:maxWheelColorInstance.productType]}"><g:message code="nut.maxWheelColorInstance.label" /></g:link>
					<g:link class="edit" action="edit" resource="${maxWheelColorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
