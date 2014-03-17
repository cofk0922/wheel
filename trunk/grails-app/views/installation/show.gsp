
<%@ page import="th.ac.chula.bsd.wheel.Installation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'installation.label', default: 'Installation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-installation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-installation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list installation">
			
				<g:if test="${installationInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="installation.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${installationInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.updatedDate}">
				<li class="fieldcontain">
					<span id="updatedDate-label" class="property-label"><g:message code="installation.updatedDate.label" default="Updated Date" /></span>
					
						<span class="property-value" aria-labelledby="updatedDate-label"><g:formatDate date="${installationInstance?.updatedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="installation.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${installationInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="installation.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${installationInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="installation.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${installationInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.appointment}">
				<li class="fieldcontain">
					<span id="appointment-label" class="property-label"><g:message code="installation.appointment.label" default="Appointment" /></span>
					
						<span class="property-value" aria-labelledby="appointment-label"><g:link controller="appointment" action="show" id="${installationInstance?.appointment?.id}">${installationInstance?.appointment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="installation.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${installationInstance?.branch?.id}">${installationInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="installation.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${installationInstance?.createdBy?.id}">${installationInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.requisitions}">
				<li class="fieldcontain">
					<span id="requisitions-label" class="property-label"><g:message code="installation.requisitions.label" default="Requisitions" /></span>
					
						<g:each in="${installationInstance.requisitions}" var="r">
						<span class="property-value" aria-labelledby="requisitions-label"><g:link controller="requisitionLine" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${installationInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="installation.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:link controller="user" action="show" id="${installationInstance?.updatedBy?.id}">${installationInstance?.updatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:installationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${installationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
