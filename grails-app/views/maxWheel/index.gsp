
<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maxWheel.label', default: 'MaxWheel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maxWheel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a class="back" href="${createLink(uri: '/configMenu/')}"><g:message code="กลับ ConfigMenu"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-maxWheel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'maxWheel.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="prodDesc" title="${message(code: 'maxWheel.prodDesc.label', default: 'Prod Desc')}" />
					
						<th><g:message code="maxWheel.productPart.label" default="Product Part" /></th>
					
						<g:sortableColumn property="productPartAmount" title="${message(code: 'maxWheel.productPartAmount.label', default: 'Product Part Amount')}" />
					
						<th><g:message code="maxWheel.band.label" default="Band" /></th>
					
						<g:sortableColumn property="model" title="${message(code: 'maxWheel.model.label', default: 'Model')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maxWheelInstanceList}" status="i" var="maxWheelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maxWheelInstance.id}">${fieldValue(bean: maxWheelInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "prodDesc")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "productPart")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "productPartAmount")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "band")}</td>
					
						<td>${fieldValue(bean: maxWheelInstance, field: "model")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maxWheelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
