
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
					
						<g:sortableColumn property="band" title="${message(code: 'carModel.band.label', default: 'Band')}" />
					
						<g:sortableColumn property="defaultTireSize" title="${message(code: 'carModel.defaultTireSize.label', default: 'Default Tire Size')}" />
					
						<th><g:message code="carModel.defaultWheel.label" default="Default Wheel" /></th>
					
						<g:sortableColumn property="gearRatio" title="${message(code: 'carModel.gearRatio.label', default: 'Gear Ratio')}" />
					
						<g:sortableColumn property="model" title="${message(code: 'carModel.model.label', default: 'Model')}" />
					
						<g:sortableColumn property="offSet" title="${message(code: 'carModel.offSet.label', default: 'Off Set')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carModelInstanceList}" status="i" var="carModelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carModelInstance.id}">${fieldValue(bean: carModelInstance, field: "band")}</g:link></td>
					
						<td>${fieldValue(bean: carModelInstance, field: "defaultTireSize")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "defaultWheel")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "gearRatio")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "model")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "offSet")}</td>
					
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
