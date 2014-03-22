
<%@ page import="th.ac.chula.bsd.inventory.ProductPurchase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productPurchase.label', default: 'ProductPurchase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productPurchase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productPurchase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="createdDate" title="${message(code: 'productPurchase.createdDate.label', default: 'Created Date')}" />
					
						<g:sortableColumn property="updatedDate" title="${message(code: 'productPurchase.updatedDate.label', default: 'Updated Date')}" />
					
						<g:sortableColumn property="arrivalDate" title="${message(code: 'productPurchase.arrivalDate.label', default: 'Arrival Date')}" />
					
						<th><g:message code="productPurchase.branch.label" default="Branch" /></th>
					
						<th><g:message code="productPurchase.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="productPurchase.paymentType.label" default="Payment Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productPurchaseInstanceList}" status="i" var="productPurchaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productPurchaseInstance.id}">${fieldValue(bean: productPurchaseInstance, field: "createdDate")}</g:link></td>
					
						<td><g:formatDate date="${productPurchaseInstance.updatedDate}" /></td>
					
						<td><g:formatDate date="${productPurchaseInstance.arrivalDate}" /></td>
					
						<td>${fieldValue(bean: productPurchaseInstance, field: "branch")}</td>
					
						<td>${fieldValue(bean: productPurchaseInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: productPurchaseInstance, field: "paymentType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productPurchaseInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
