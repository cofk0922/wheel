<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'maxWheel.label', default: 'MaxWheel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-maxWheel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maxWheel">
			
				<g:if test="${maxWheelInstance?.band}">
				<li class="fieldcontain">
					<span id="band-label" class="property-label"><g:message code="maxWheel.band.label" default="Band" /></span>
					
						<span class="property-value" aria-labelledby="band-label"><g:link controller="wheelBand" action="show" id="${maxWheelInstance?.band?.id}">${maxWheelInstance?.band?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="maxWheel.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${maxWheelInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
						
				<g:if test="${maxWheelInstance?.series}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="maxWheel.series.label" default="Series" /></span>
					
						<span class="property-value" aria-labelledby="series-label"><g:fieldValue bean="${maxWheelInstance}" field="series"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="maxWheel.size.label" default="Size" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${maxWheelInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.prodDesc}">
				<li class="fieldcontain">
					<span id="prodDesc-label" class="property-label"><g:message code="maxWheel.prodDesc.label" default="Prod Desc" /></span>
					
						<span class="property-value" aria-labelledby="prodDesc-label"><g:fieldValue bean="${maxWheelInstance}" field="prodDesc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.productPart}">
				<li class="fieldcontain">
					<span id="productPart-label" class="property-label"><g:message code="maxWheel.productPart.label" default="Product Part" /></span>
					
						<span class="property-value" aria-labelledby="productPart-label"><g:link controller="product" action="show" id="${maxWheelInstance?.productPart?.id}">${maxWheelInstance?.productPart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.productPartAmount}">
				<li class="fieldcontain">
					<span id="productPartAmount-label" class="property-label"><g:message code="maxWheel.productPartAmount.label" default="Product Part Amount" /></span>
					
						<span class="property-value" aria-labelledby="productPartAmount-label"><g:fieldValue bean="${maxWheelInstance}" field="productPartAmount"/></span>
					
				</li>
				</g:if>

				<g:if test="${maxWheelInstance?.width}">
				<li class="fieldcontain">
					<span id="width-label" class="property-label"><g:message code="maxWheel.width.label" default="Width" /></span>
					
						<span class="property-value" aria-labelledby="width-label"><g:fieldValue bean="${maxWheelInstance}" field="width"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="maxWheel.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${maxWheelInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.pcdCode}">
				<li class="fieldcontain">
					<span id="pcdCode-label" class="property-label"><g:message code="maxWheel.pcdCode.label" default="Pcd Code" /></span>
					
						<span class="property-value" aria-labelledby="pcdCode-label"><g:fieldValue bean="${maxWheelInstance}" field="pcdCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.offSet}">
				<li class="fieldcontain">
					<span id="offSet-label" class="property-label"><g:message code="maxWheel.offSet.label" default="Off Set" /></span>
					
						<span class="property-value" aria-labelledby="offSet-label"><g:fieldValue bean="${maxWheelInstance}" field="offSet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.pStatus}">
				<li class="fieldcontain">
					<span id="pStatus-label" class="property-label"><g:message code="maxWheel.pStatus.label" default="PS tatus" /></span>
					
						<span class="property-value" aria-labelledby="pStatus-label"><g:fieldValue bean="${maxWheelInstance}" field="pStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.productStocks}">
				<li class="fieldcontain">
					<span id="productStocks-label" class="property-label"><g:message code="maxWheel.productStocks.label" default="Product Stocks" /></span>
					
						<g:each in="${maxWheelInstance.productStocks}" var="p">
						<span class="property-value" aria-labelledby="productStocks-label"><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.productType}">
				<li class="fieldcontain">
					<span id="productType-label" class="property-label"><g:message code="maxWheel.productType.label" default="Product Type" /></span>
					
						<span class="property-value" aria-labelledby="productType-label"><g:fieldValue bean="${maxWheelInstance}" field="productType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.productVendorTransfers}">
				<li class="fieldcontain">
					<span id="productVendorTransfers-label" class="property-label"><g:message code="maxWheel.productVendorTransfers.label" default="Product Vendor Transfers" /></span>
					
						<g:each in="${maxWheelInstance.productVendorTransfers}" var="p">
						<span class="property-value" aria-labelledby="productVendorTransfers-label"><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.spoke}">
				<li class="fieldcontain">
					<span id="spoke-label" class="property-label"><g:message code="maxWheel.spoke.label" default="Spoke" /></span>
					
						<span class="property-value" aria-labelledby="spoke-label"><g:fieldValue bean="${maxWheelInstance}" field="spoke"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.wheelLists}">
				<li class="fieldcontain">
					<span id="wheelLists-label" class="property-label"><g:message code="maxWheel.wheelLists.label" default="Wheel Lists" /></span>
					
						<g:each in="${maxWheelInstance.wheelLists}" var="w">
						<span class="property-value" aria-labelledby="wheelLists-label"><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:maxWheelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${maxWheelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
