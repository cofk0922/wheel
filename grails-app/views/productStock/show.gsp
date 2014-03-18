<%@ page import="th.ac.chula.bsd.wheel.ProductStock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productStock.label', default: 'ProductStock')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-productStock" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productStock">
			
				<g:if test="${productStockInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="productStock.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${productStockInstance?.branch?.id}">${productStockInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productStockInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productStock.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productStockInstance?.product?.id}">${productStockInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productStockInstance?.stock}">
				<li class="fieldcontain">
					<span id="stock-label" class="property-label"><g:message code="productStock.stock.label" default="Stock" /></span>
					
						<span class="property-value" aria-labelledby="stock-label"><g:fieldValue bean="${productStockInstance}" field="stock"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productStockInstance?.unitPrice}">
				<li class="fieldcontain">
					<span id="unitPrice-label" class="property-label"><g:message code="productStock.unitPrice.label" default="Unit Price" /></span>
					
						<span class="property-value" aria-labelledby="unitPrice-label"><g:fieldValue bean="${productStockInstance}" field="unitPrice"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productStockInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productStockInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
