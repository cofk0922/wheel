
<%@ page import="th.ac.chula.bsd.wheel.ProductBranchTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productBranchTransfer.label', default: 'ProductBranchTransfer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-productBranchTransfer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productBranchTransfer">
			
				<g:if test="${productBranchTransferInstance?.branchFrom}">
				<li class="fieldcontain">
					<span id="branchFrom-label" class="property-label"><g:message code="productBranchTransfer.branchFrom.label" default="Branch From" /></span>
					
						<span class="property-value" aria-labelledby="branchFrom-label"><g:link controller="branch" action="show" id="${productBranchTransferInstance?.branchFrom?.id}">${productBranchTransferInstance?.branchFrom?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productBranchTransferInstance?.branchTo}">
				<li class="fieldcontain">
					<span id="branchTo-label" class="property-label"><g:message code="productBranchTransfer.branchTo.label" default="Branch To" /></span>
					
						<span class="property-value" aria-labelledby="branchTo-label"><g:link controller="branch" action="show" id="${productBranchTransferInstance?.branchTo?.id}">${productBranchTransferInstance?.branchTo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productBranchTransferInstance?.transferDay}">
				<li class="fieldcontain">
					<span id="transferDay-label" class="property-label"><g:message code="productBranchTransfer.transferDay.label" default="Transfer Day" /></span>
					
						<span class="property-value" aria-labelledby="transferDay-label">
						<g:fieldValue bean="${productBranchTransferInstance}" field="transferDay"/>
						<g:message code="default.day" />
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${productBranchTransferInstance?.transferHour}">
				<li class="fieldcontain">
					<span id="transferHour-label" class="property-label"><g:message code="productBranchTransfer.transferHour.label" default="Transfer Hour" /></span>
					
						<span class="property-value" aria-labelledby="transferHour-label">
						<g:fieldValue bean="${productBranchTransferInstance}" field="transferHour"/>
						<g:message code="default.hour" />
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${productBranchTransferInstance?.transferMinute}">
				<li class="fieldcontain">
					<span id="transferMinute-label" class="property-label"><g:message code="productBranchTransfer.transferMinute.label" default="Transfer Minute" /></span>
					
						<span class="property-value" aria-labelledby="transferMinute-label">
						<g:fieldValue bean="${productBranchTransferInstance}" field="transferMinute"/>
						<g:message code="default.minute" />
						</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productBranchTransferInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productBranchTransferInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
