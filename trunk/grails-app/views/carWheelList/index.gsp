<%@ page import="th.ac.chula.bsd.wheel.CarWheelList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'carWheelList.label', default: 'CarWheelList')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-carWheelList" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="carWheelList.car.label" default="Car" /></th>
					
						<g:sortableColumn property="driveStar" title="${message(code: 'carWheelList.driveStar.label', default: 'Drive Star')}" />
					
						<g:sortableColumn property="drivingEnergy" title="${message(code: 'carWheelList.drivingEnergy.label', default: 'Driving Energy')}" />
					
						<g:sortableColumn property="listOrder" title="${message(code: 'carWheelList.listOrder.label', default: 'List Order')}" />
					
						<g:sortableColumn property="tractiveEnergy" title="${message(code: 'carWheelList.tractiveEnergy.label', default: 'Tractive Energy')}" />
					
						<g:sortableColumn property="tractiveStar" title="${message(code: 'carWheelList.tractiveStar.label', default: 'Tractive Star')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carWheelListInstanceList}" status="i" var="carWheelListInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carWheelListInstance.id}">${fieldValue(bean: carWheelListInstance, field: "car")}</g:link></td>
					
						<td>${fieldValue(bean: carWheelListInstance, field: "driveStar")}</td>
					
						<td>${fieldValue(bean: carWheelListInstance, field: "drivingEnergy")}</td>
					
						<td>${fieldValue(bean: carWheelListInstance, field: "listOrder")}</td>
					
						<td>${fieldValue(bean: carWheelListInstance, field: "tractiveEnergy")}</td>
					
						<td>${fieldValue(bean: carWheelListInstance, field: "tractiveStar")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carWheelListInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
