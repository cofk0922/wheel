
<%@ page import="th.ac.chula.bsd.wheel.CarBand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'carBand.label', default: 'CarBand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-carBand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="bandName" title="${message(code: 'carBand.bandName.label', default: 'Band Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carBandInstanceList}" status="i" var="carBandInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carBandInstance.id}">${fieldValue(bean: carBandInstance, field: "bandName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carBandInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
