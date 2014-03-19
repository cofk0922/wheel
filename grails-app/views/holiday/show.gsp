
<%@ page import="th.ac.chula.bsd.wheel.Holiday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-holiday" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list holiday">
			
				<g:if test="${holidayInstance?.holidayDate}">
				<li class="fieldcontain">
					<span id="holidayDate-label" class="property-label"><g:message code="holiday.holidayDate.label" default="Holiday Date" /></span>
					
						<span class="property-value" aria-labelledby="holidayDate-label">
							<g:formatDate formatName="default.date.shortformat" date="${holidayInstance?.holidayDate}" />
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${holidayInstance?.holidayName}">
				<li class="fieldcontain">
					<span id="holidayName-label" class="property-label"><g:message code="holiday.holidayName.label" default="Holiday Name" /></span>
					
						<span class="property-value" aria-labelledby="holidayName-label"><g:fieldValue bean="${holidayInstance}" field="holidayName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:holidayInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${holidayInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
