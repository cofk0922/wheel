
<%@ page import="th.ac.chula.bsd.wheel.Vendor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-vendor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vendor">
			
				<g:if test="${vendorInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="vendor.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:fieldValue bean="${vendorInstance}" field="vendorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorInstance?.vendorAddress}">
				<li class="fieldcontain">
					<span id="vendorAddress-label" class="property-label"><g:message code="vendor.vendorAddress.label" default="Vendor Address" /></span>
					
						<span class="property-value" aria-labelledby="vendorAddress-label"><g:fieldValue bean="${vendorInstance}" field="vendorAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorInstance?.productVendors}">
				<li class="fieldcontain">
					<span id="productVendors-label" class="property-label"><g:message code="vendor.productVendors.label" default="Product Vendors" /></span>
					
						<g:each in="${vendorInstance.productVendors}" var="p">
						<span class="property-value" aria-labelledby="productVendors-label"><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vendorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vendorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
