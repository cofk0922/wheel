
<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carModel.label', default: 'CarModel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-carModel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a class="back" href="${createLink(uri: '/configMenu/')}"><g:message code="กลับ ConfigMenu"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-carModel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="carModel.band.label" default="Band" /></th>
					
						<g:sortableColumn property="model" title="${message(code: 'carModel.model.label', default: 'Model')}" />
					
						<g:sortableColumn property="backX1" title="${message(code: 'carModel.backX1.label', default: 'Back X1')}" />
					
						<g:sortableColumn property="backX2" title="${message(code: 'carModel.backX2.label', default: 'Back X2')}" />
					
						<g:sortableColumn property="backY" title="${message(code: 'carModel.backY.label', default: 'Back Y')}" />
					
						<g:sortableColumn property="backY1" title="${message(code: 'carModel.backY1.label', default: 'Back Y1')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carModelInstanceList}" status="i" var="carModelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carModelInstance.id}">${fieldValue(bean: carModelInstance, field: "band.bandName")}</g:link></td>
					
						<td>${fieldValue(bean: carModelInstance, field: "model")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "backX1")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "backX2")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "backY")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "backY1")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carModelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
