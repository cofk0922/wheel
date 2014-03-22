
<%@ page import="th.ac.chula.bsd.inventory.PreProductPurchaseLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'preProductPurchaseLine.label', default: 'PreProductPurchaseLine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-preProductPurchaseLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-preProductPurchaseLine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="preProductPurchaseLine.product.label" default="Product" /></th>
					
						<g:sortableColumn property="createdDate" title="${message(code: 'preProductPurchaseLine.createdDate.label', default: 'Created Date')}" />
					
						<g:sortableColumn property="updatedDate" title="${message(code: 'preProductPurchaseLine.updatedDate.label', default: 'Updated Date')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'preProductPurchaseLine.amount.label', default: 'Amount')}" />
					
						<th><g:message code="preProductPurchaseLine.appointment.label" default="Appointment" /></th>
					
						<th><g:message code="preProductPurchaseLine.branch.label" default="Branch" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${preProductPurchaseLineInstanceList}" status="i" var="preProductPurchaseLineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${preProductPurchaseLineInstance.id}">${fieldValue(bean: preProductPurchaseLineInstance, field: "product")}</g:link></td>
					
						<td><g:formatDate date="${preProductPurchaseLineInstance.createdDate}" /></td>
					
						<td><g:formatDate date="${preProductPurchaseLineInstance.updatedDate}" /></td>
					
						<td>${fieldValue(bean: preProductPurchaseLineInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: preProductPurchaseLineInstance, field: "appointment")}</td>
					
						<td>${fieldValue(bean: preProductPurchaseLineInstance, field: "branch")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${preProductPurchaseLineInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
