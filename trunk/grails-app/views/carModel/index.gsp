
<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'carModel.label', default: 'CarModel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-carModel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="carModel.band.label" default="Band" /></th>
					
						<g:sortableColumn property="modelName" title="${message(code: 'carModel.modelName.label', default: 'Model Name')}" />
					
						<g:sortableColumn property="year" title="${message(code: 'carModel.year.label', default: 'Year')}" />
					
						<g:sortableColumn property="pcdCode" title="${message(code: 'carModel.pcdCode.label', default: 'Pcd Code')}" />
					
						<g:sortableColumn property="offSet" title="${message(code: 'carModel.offSet.label', default: 'OffSet No.')}" />
					
						<g:sortableColumn property="gearRatio" title="${message(code: 'carModel.gearRatio.label', default: 'Gear Ratio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carModelInstanceList}" status="i" var="carModelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carModelInstance.id}">${fieldValue(bean: carModelInstance, field: "band.bandName")}</g:link></td>
					
						<td>${fieldValue(bean: carModelInstance, field: "modelName")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "year")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "pcdCode")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "offSet")}</td>
					
						<td>${fieldValue(bean: carModelInstance, field: "gearRatio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carModelInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
