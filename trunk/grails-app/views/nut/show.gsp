
<%@ page import="th.ac.chula.bsd.wheel.Nut" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'nut.label', default: 'Nut')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-nut" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nut">
			
				<g:if test="${nutInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="nut.prodName.label" default="=ชื่อเกลียวน๊อต" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${nutInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutInstance?.prodDesc}">
				<li class="fieldcontain">
					<span id="prodDesc-label" class="property-label"><g:message code="nut.prodDesc.label" default="รายละเอียด" /></span>
					
						<span class="property-value" aria-labelledby="prodDesc-label"><g:fieldValue bean="${nutInstance}" field="prodDesc"/></span>
					
				</li>
				</g:if>
			
				<%--<g:if test="${nutInstance?.productPart}">
				<li class="fieldcontain">
					<span id="productPart-label" class="property-label"><g:message code="nut.productPart.label" default="Product Part" /></span>
					
						<span class="property-value" aria-labelledby="productPart-label"><g:link controller="product" action="show" id="${nutInstance?.productPart?.id}">${nutInstance?.productPart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutInstance?.productPartAmount}">
				<li class="fieldcontain">
					<span id="productPartAmount-label" class="property-label"><g:message code="nut.productPartAmount.label" default="Product Part Amount" /></span>
					
						<span class="property-value" aria-labelledby="productPartAmount-label"><g:fieldValue bean="${nutInstance}" field="productPartAmount"/></span>
					
				</li>
				</g:if>--%>
			
				<g:if test="${nutInstance?.nutSize}">
				<li class="fieldcontain">
					<span id="nutSize-label" class="property-label"><g:message code="nut.nutSize.label" default="ขนาดเกลียวน๊อต(มิลลิเมตร)" /></span>
					
						<span class="property-value" aria-labelledby="nutSize-label"><g:fieldValue bean="${nutInstance}" field="nutSize"/></span>
					
				</li>
				</g:if>
			
				<%--<g:if test="${nutInstance?.productStocks}">
				<li class="fieldcontain">
					<span id="productStocks-label" class="property-label"><g:message code="nut.productStocks.label" default="Product Stocks" /></span>
					
						<g:each in="${nutInstance.productStocks}" var="p">
						<span class="property-value" aria-labelledby="productStocks-label"><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${nutInstance?.productType}">
				<li class="fieldcontain">
					<span id="productType-label" class="property-label"><g:message code="nut.productType.label" default="Product Type" /></span>
					
						<span class="property-value" aria-labelledby="productType-label"><g:fieldValue bean="${nutInstance}" field="productType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutInstance?.productVendorTransfers}">
				<li class="fieldcontain">
					<span id="productVendorTransfers-label" class="property-label"><g:message code="nut.productVendorTransfers.label" default="Product Vendor Transfers" /></span>
					
						<g:each in="${nutInstance.productVendorTransfers}" var="p">
						<span class="property-value" aria-labelledby="productVendorTransfers-label"><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if> --%>
			
			</ol>
			<g:form url="[resource:nutInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${nutInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
