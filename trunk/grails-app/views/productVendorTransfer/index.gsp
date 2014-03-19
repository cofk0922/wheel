
<%@ page import="th.ac.chula.bsd.wheel.ProductVendorTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-productVendorTransfer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="productVendorTransfer.branch.label" default="Branch" /></th>
					
						<th><g:message code="productVendorTransfer.product.label" default="Product" /></th>
					
						<g:sortableColumn property="transferDay" title="${message(code: 'productVendorTransfer.transferDay.label', default: 'Transfer Day')}" />
					
						<g:sortableColumn property="transferHour" title="${message(code: 'productVendorTransfer.transferHour.label', default: 'Transfer Hour')}" />
					
						<g:sortableColumn property="transferMinute" title="${message(code: 'productVendorTransfer.transferMinute.label', default: 'Transfer Minute')}" />
					
						<g:sortableColumn property="unitPrice" title="${message(code: 'productVendorTransfer.unitPrice.label', default: 'Unit Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productVendorTransferInstanceList}" status="i" var="productVendorTransferInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productVendorTransferInstance.id}">${fieldValue(bean: productVendorTransferInstance, field: "branch")}</g:link></td>
					
						<td>${fieldValue(bean: productVendorTransferInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: productVendorTransferInstance, field: "transferDay")}</td>
					
						<td>${fieldValue(bean: productVendorTransferInstance, field: "transferHour")}</td>
					
						<td>${fieldValue(bean: productVendorTransferInstance, field: "transferMinute")}</td>
					
						<td>${fieldValue(bean: productVendorTransferInstance, field: "unitPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productVendorTransferInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
