<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'maxWheel.label', default: 'MaxWheel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-maxWheel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="maxWheel.band.label" default="Band" /></th>
					
						<g:sortableColumn property="prodName" title="${message(code: 'maxWheel.prodName.label', default: 'Wheel Name')}" />
					
						<g:sortableColumn property="prodDesc" title="${message(code: 'maxWheel.prodDesc.label', default: 'Wheel Desc')}" />
					
						<g:sortableColumn property="series" title="${message(code: 'maxWheel.series.label', default: 'Series')}" />
					
						<th><g:message code="maxWheel.productPart.label" default="Product Part" /></th>
					
						<g:sortableColumn property="productPartAmount" title="${message(code: 'maxWheel.productPartAmount.label', default: 'Product Part Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maxWheelInstanceList}" status="i" var="maxWheelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maxWheelInstance.id}">${fieldValue(bean: maxWheelInstance, field: "band.name")}</g:link></td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "prodName")}</td>
						
						<td>${fieldValue(bean: maxWheelInstance, field: "prodDesc")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "series")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "productPart")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "productPartAmount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maxWheelInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
