
<%@ page import="th.ac.chula.bsd.wheel.Holiday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'holiday.label', default: 'Holiday')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-holiday" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="holidayDate" title="${message(code: 'holiday.holidayDate.label', default: 'Holiday Date')}" />
					
						<g:sortableColumn property="holidayName" title="${message(code: 'holiday.holidayName.label', default: 'Holiday Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${holidayInstanceList}" status="i" var="holidayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${holidayInstance.id}"><g:formatDate formatName="default.date.shortformat" date="${holidayInstance?.holidayDate}" /></g:link></td>
					
						<td>${fieldValue(bean: holidayInstance, field: "holidayName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${holidayInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
