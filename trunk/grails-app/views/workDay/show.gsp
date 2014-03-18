
<%@ page import="th.ac.chula.bsd.wheel.WorkDay" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'workDay.label', default: 'WorkDay')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="/branch/submenu" />
		</content>
		<content tag="content">
		<div id="show-workDay" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
				<g:if test="${workDayInstance?.branch}">
				:
				<g:link controller="branch" action="show" id="${workDayInstance?.branch?.id}">${workDayInstance?.branch?.branchName}</g:link>
				</g:if>
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workDay">
			
				<g:if test="${workDayInstance?.workDayName}">
				<li class="fieldcontain">
					<span id="workDayName-label" class="property-label"><g:message code="workDay.workDayName.label" default="Work Day Name" /></span>
					
						<span class="property-value" aria-labelledby="workDayName-label"><g:fieldValue bean="${workDayInstance}" field="workDayName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workDayInstance?.startHour}">
				<li class="fieldcontain">
					<span id="startHour-label" class="property-label"><g:message code="workDay.startHour.label" default="Start Hour" /></span>
					
						<span class="property-value" aria-labelledby="startHour-label">
						<g:fieldValue bean="${workDayInstance}" field="startHour"/>:
						<g:if test="${workDayInstance.startMinute == 0}">
							00
						</g:if>
						<g:else>
							<g:fieldValue bean="${workDayInstance}" field="startMinute"/>
						</g:else>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${workDayInstance?.endHour}">
				<li class="fieldcontain">
					<span id="endHour-label" class="property-label"><g:message code="workDay.endHour.label" default="End Hour" /></span>
					
						<span class="property-value" aria-labelledby="endHour-label">
						<g:fieldValue bean="${workDayInstance}" field="endHour"/>:
						<g:if test="${workDayInstance.endMinute == 0}">
							00
						</g:if>
						<g:else>
							<g:fieldValue bean="${workDayInstance}" field="endMinute"/>
						</g:else>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${workDayInstance?.workActive}">
				<li class="fieldcontain">
					<span id="workActive-label" class="property-label"><g:message code="workDay.workActive.label" default="Work Active" /></span>
					
						<span class="property-value" aria-labelledby="workActive-label"><g:formatBoolean boolean="${workDayInstance?.workActive}" /></span>
					
				</li>
				</g:if>
			<%--
				<g:if test="${workDayInstance?.workDayCode}">
				<li class="fieldcontain">
					<span id="workDayCode-label" class="property-label"><g:message code="workDay.workDayCode.label" default="Work Day Code" /></span>
					
						<span class="property-value" aria-labelledby="workDayCode-label"><g:fieldValue bean="${workDayInstance}" field="workDayCode"/></span>
					
				</li>
				</g:if>
			--%>
			</ol>
			<g:form url="[resource:workDayInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${workDayInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<%--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /> --%>
				</fieldset>
			</g:form>
		</div>
		</content>
	</body>
</html>
