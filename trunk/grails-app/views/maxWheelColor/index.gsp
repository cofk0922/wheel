
<%@ page import="th.ac.chula.bsd.wheel.MaxWheelColor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maxWheelColor.label', default: 'MaxWheelColor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maxWheelColor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-maxWheelColor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'maxWheelColor.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="prodDesc" title="${message(code: 'maxWheelColor.prodDesc.label', default: 'Prod Desc')}" />
					
						<th><g:message code="maxWheelColor.productPart.label" default="Product Part" /></th>
					
						<g:sortableColumn property="productPartAmount" title="${message(code: 'maxWheelColor.productPartAmount.label', default: 'Product Part Amount')}" />
					
						<g:sortableColumn property="colorName" title="${message(code: 'maxWheelColor.colorName.label', default: 'Color Name')}" />
					
						<g:sortableColumn property="hVal" title="${message(code: 'maxWheelColor.hVal.label', default: 'HV al')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maxWheelColorInstanceList}" status="i" var="maxWheelColorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maxWheelColorInstance.id}">${fieldValue(bean: maxWheelColorInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: maxWheelColorInstance, field: "prodDesc")}</td>
					
						<td>${fieldValue(bean: maxWheelColorInstance, field: "productPart")}</td>
					
						<td>${fieldValue(bean: maxWheelColorInstance, field: "productPartAmount")}</td>
					
						<td>${fieldValue(bean: maxWheelColorInstance, field: "colorName")}</td>
					
						<td>${fieldValue(bean: maxWheelColorInstance, field: "hVal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maxWheelColorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
