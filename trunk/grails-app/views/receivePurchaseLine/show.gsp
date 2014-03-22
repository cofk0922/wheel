
<%@ page import="th.ac.chula.bsd.inventory.ReceivePurchaseLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receivePurchaseLine.label', default: 'ReceivePurchaseLine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-receivePurchaseLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-receivePurchaseLine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list receivePurchaseLine">
			
				<g:if test="${receivePurchaseLineInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="receivePurchaseLine.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${receivePurchaseLineInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${receivePurchaseLineInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="receivePurchaseLine.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${receivePurchaseLineInstance?.product?.id}">${receivePurchaseLineInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${receivePurchaseLineInstance?.receivePurchase}">
				<li class="fieldcontain">
					<span id="receivePurchase-label" class="property-label"><g:message code="receivePurchaseLine.receivePurchase.label" default="Receive Purchase" /></span>
					
						<span class="property-value" aria-labelledby="receivePurchase-label"><g:link controller="receivePurchase" action="show" id="${receivePurchaseLineInstance?.receivePurchase?.id}">${receivePurchaseLineInstance?.receivePurchase?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:receivePurchaseLineInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${receivePurchaseLineInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
