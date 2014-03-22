
<%@ page import="th.ac.chula.bsd.inventory.PreProductTransferLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'preProductTransferLine.label', default: 'PreProductTransferLine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-preProductTransferLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-preProductTransferLine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list preProductTransferLine">
			
				<g:if test="${preProductTransferLineInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="preProductTransferLine.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${preProductTransferLineInstance?.product?.id}">${preProductTransferLineInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="preProductTransferLine.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${preProductTransferLineInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="preProductTransferLine.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${preProductTransferLineInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.updatedDate}">
				<li class="fieldcontain">
					<span id="updatedDate-label" class="property-label"><g:message code="preProductTransferLine.updatedDate.label" default="Updated Date" /></span>
					
						<span class="property-value" aria-labelledby="updatedDate-label"><g:formatDate date="${preProductTransferLineInstance?.updatedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.appointment}">
				<li class="fieldcontain">
					<span id="appointment-label" class="property-label"><g:message code="preProductTransferLine.appointment.label" default="Appointment" /></span>
					
						<span class="property-value" aria-labelledby="appointment-label"><g:link controller="appointment" action="show" id="${preProductTransferLineInstance?.appointment?.id}">${preProductTransferLineInstance?.appointment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="preProductTransferLine.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${preProductTransferLineInstance?.branch?.id}">${preProductTransferLineInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="preProductTransferLine.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${preProductTransferLineInstance?.createdBy?.id}">${preProductTransferLineInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.productTransferLines}">
				<li class="fieldcontain">
					<span id="productTransferLines-label" class="property-label"><g:message code="preProductTransferLine.productTransferLines.label" default="Product Transfer Lines" /></span>
					
						<g:each in="${preProductTransferLineInstance.productTransferLines}" var="p">
						<span class="property-value" aria-labelledby="productTransferLines-label"><g:link controller="productTransferLine" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="preProductTransferLine.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${preProductTransferLineInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preProductTransferLineInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="preProductTransferLine.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:link controller="user" action="show" id="${preProductTransferLineInstance?.updatedBy?.id}">${preProductTransferLineInstance?.updatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:preProductTransferLineInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${preProductTransferLineInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
