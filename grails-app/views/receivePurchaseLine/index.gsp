
<%@ page import="th.ac.chula.bsd.inventory.ReceivePurchaseLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receivePurchaseLine.label', default: 'ReceivePurchaseLine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-receivePurchaseLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-receivePurchaseLine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="amount" title="${message(code: 'receivePurchaseLine.amount.label', default: 'Amount')}" />
					
						<th><g:message code="receivePurchaseLine.product.label" default="Product" /></th>
					
						<th><g:message code="receivePurchaseLine.receivePurchase.label" default="Receive Purchase" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${receivePurchaseLineInstanceList}" status="i" var="receivePurchaseLineInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${receivePurchaseLineInstance.id}">${fieldValue(bean: receivePurchaseLineInstance, field: "amount")}</g:link></td>
					
						<td>${fieldValue(bean: receivePurchaseLineInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: receivePurchaseLineInstance, field: "receivePurchase")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${receivePurchaseLineInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
