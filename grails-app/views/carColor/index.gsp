
<%@ page import="th.ac.chula.bsd.wheel.CarColor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-car" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="band" title="${message(code: 'car.band.label', default: 'Band')}" />
					
						<g:sortableColumn property="model" title="${message(code: 'car.model.label', default: 'Model')}" />
					
						<g:sortableColumn property="pcdCode" title="${message(code: 'car.pcdCode.label', default: 'Pcd Code')}" />
					
						<g:sortableColumn property="defaultTireSize" title="${message(code: 'car.defaultTireSize.label', default: 'Default Tire Size')}" />
					
						<th><g:message code="car.defaultWheel.label" default="Default Wheel" /></th>
					
						<g:sortableColumn property="gearRatio" title="${message(code: 'car.gearRatio.label', default: 'Gear Ratio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carInstanceList}" status="i" var="carInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "band")}</g:link></td>
					
						<td>${fieldValue(bean: carInstance, field: "model")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "pcdCode")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "defaultTireSize")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "defaultWheel")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "gearRatio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
