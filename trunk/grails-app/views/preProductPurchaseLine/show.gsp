
<%@ page import="th.ac.chula.bsd.inventory.PreProductPurchaseLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'preProductPurchaseLine.label', default: 'PreProductPurchaseLine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-preProductPurchaseLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-preProductPurchaseLine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list preProductPurchaseLine">
			
				<g:if test="${preProductPurchaseLineInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="preProductPurchaseLine.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${preProductPurchaseLineInstance?.product?.id}">${preProductPurchaseLineInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="preProductPurchaseLine.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${preProductPurchaseLineInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.updatedDate}">
				<li class="fieldcontain">
					<span id="updatedDate-label" class="property-label"><g:message code="preProductPurchaseLine.updatedDate.label" default="Updated Date" /></span>
					
						<span class="property-value" aria-labelledby="updatedDate-label"><g:formatDate date="${preProductPurchaseLineInstance?.updatedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="preProductPurchaseLine.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${preProductPurchaseLineInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.appointment}">
				<li class="fieldcontain">
					<span id="appointment-label" class="property-label"><g:message code="preProductPurchaseLine.appointment.label" default="Appointment" /></span>
					
						<span class="property-value" aria-labelledby="appointment-label"><g:link controller="appointment" action="show" id="${preProductPurchaseLineInstance?.appointment?.id}">${preProductPurchaseLineInstance?.appointment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="preProductPurchaseLine.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${preProductPurchaseLineInstance?.branch?.id}">${preProductPurchaseLineInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="preProductPurchaseLine.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${preProductPurchaseLineInstance?.createdBy?.id}">${preProductPurchaseLineInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="preProductPurchaseLine.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${preProductPurchaseLineInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductPurchaseLineInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="preProductPurchaseLine.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:link controller="user" action="show" id="${preProductPurchaseLineInstance?.updatedBy?.id}">${preProductPurchaseLineInstance?.updatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:preProductPurchaseLineInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${preProductPurchaseLineInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
