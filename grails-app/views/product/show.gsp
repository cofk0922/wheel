
<%@ page import="th.ac.chula.bsd.wheel.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.prodName}">
				<li class="fieldcontain">
					<span id="prodName-label" class="property-label"><g:message code="product.prodName.label" default="Prod Name" /></span>
					
						<span class="property-value" aria-labelledby="prodName-label"><g:fieldValue bean="${productInstance}" field="prodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.prodDesc}">
				<li class="fieldcontain">
					<span id="prodDesc-label" class="property-label"><g:message code="product.prodDesc.label" default="Prod Desc" /></span>
					
						<span class="property-value" aria-labelledby="prodDesc-label"><g:fieldValue bean="${productInstance}" field="prodDesc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productPart}">
				<li class="fieldcontain">
					<span id="productPart-label" class="property-label"><g:message code="product.productPart.label" default="Product Part" /></span>
					
						<span class="property-value" aria-labelledby="productPart-label"><g:link controller="product" action="show" id="${productInstance?.productPart?.id}">${productInstance?.productPart?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productPartAmount}">
				<li class="fieldcontain">
					<span id="productPartAmount-label" class="property-label"><g:message code="product.productPartAmount.label" default="Product Part Amount" /></span>
					
						<span class="property-value" aria-labelledby="productPartAmount-label"><g:fieldValue bean="${productInstance}" field="productPartAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productStocks}">
				<li class="fieldcontain">
					<span id="productStocks-label" class="property-label"><g:message code="product.productStocks.label" default="Product Stocks" /></span>
					
						<g:each in="${productInstance.productStocks}" var="p">
						<span class="property-value" aria-labelledby="productStocks-label"><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productType}">
				<li class="fieldcontain">
					<span id="productType-label" class="property-label"><g:message code="product.productType.label" default="Product Type" /></span>
					
						<span class="property-value" aria-labelledby="productType-label"><g:fieldValue bean="${productInstance}" field="productType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.productVendorTransfers}">
				<li class="fieldcontain">
					<span id="productVendorTransfers-label" class="property-label"><g:message code="product.productVendorTransfers.label" default="Product Vendor Transfers" /></span>
					
						<g:each in="${productInstance.productVendorTransfers}" var="p">
						<span class="property-value" aria-labelledby="productVendorTransfers-label"><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
