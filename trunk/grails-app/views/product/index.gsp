
<%@ page import="th.ac.chula.bsd.wheel.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-product" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'product.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="prodDesc" title="${message(code: 'product.prodDesc.label', default: 'Prod Desc')}" />
					
						<th><g:message code="product.productPart.label" default="Product Part" /></th>
					
						<g:sortableColumn property="productPartAmount" title="${message(code: 'product.productPartAmount.label', default: 'Product Part Amount')}" />
					
						<g:sortableColumn property="productType" title="${message(code: 'product.productType.label', default: 'Product Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: productInstance, field: "prodDesc")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "productPart")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "productPartAmount")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "productType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
