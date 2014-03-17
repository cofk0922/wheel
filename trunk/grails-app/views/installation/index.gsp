
<%@ page import="th.ac.chula.bsd.wheel.Installation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'installation.label', default: 'Installation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-installation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-installation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdDate" title="${message(code: 'installation.createdDate.label', default: 'Created Date')}" />
					
						<g:sortableColumn property="updatedDate" title="${message(code: 'installation.updatedDate.label', default: 'Updated Date')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'installation.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'installation.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'installation.status.label', default: 'Status')}" />
					
						<th><g:message code="installation.appointment.label" default="Appointment" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${installationInstanceList}" status="i" var="installationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${installationInstance.id}">${fieldValue(bean: installationInstance, field: "createdDate")}</g:link></td>
					
						<td><g:formatDate date="${installationInstance.updatedDate}" /></td>
					
						<td><g:formatDate date="${installationInstance.startDate}" /></td>
					
						<td><g:formatDate date="${installationInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: installationInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: installationInstance, field: "appointment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${installationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
