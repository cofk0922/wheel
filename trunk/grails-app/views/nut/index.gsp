
<%@ page import="th.ac.chula.bsd.wheel.Nut" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'nut.label', default: 'Nut')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-nut" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="prodName" title="${message(code: 'nut.prodName.label', default: 'Prod Name')}" />
					
						<g:sortableColumn property="prodDesc" title="${message(code: 'nut.prodDesc.label', default: 'Prod Desc')}" />
					<%--
						<th><g:message code="nut.productPart.label" default="Product Part" /></th>
					
						<g:sortableColumn property="productPartAmount" title="${message(code: 'nut.productPartAmount.label', default: 'Product Part Amount')}" />
					 --%>
						<g:sortableColumn property="nutSize" title="${message(code: 'nut.nutSize.label', default: 'Nut Size')}" />
					
						<%--<g:sortableColumn property="productType" title="${message(code: 'nut.productType.label', default: 'Product Type')}" /> --%>
						
						<th><g:message code="nut.stock.label" default="Stock" /></th>
						
						<th><g:message code="nut.vendorCount.label" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${nutInstanceList}" status="i" var="nutInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nutInstance.id}">${fieldValue(bean: nutInstance, field: "prodName")}</g:link></td>
					
						<td>${fieldValue(bean: nutInstance, field: "prodDesc")}</td>
					<%--
						<td>${fieldValue(bean: nutInstance, field: "productPart")}</td>
					
						<td>${fieldValue(bean: nutInstance, field: "productPartAmount")}</td>
					 --%>
						<td>
							${fieldValue(bean: nutInstance, field: "nutSize")}
							<g:message code="default.millimeter" />
						</td>
					
						<%--<td>${fieldValue(bean: nutInstance, field: "productType")}</td> --%>
						<td>
							<g:if test="${nutInstance.getProductStock(params.branch) > 0}">
								${nutInstance.getProductStock(params.branch)}
								<g:message code="default.count.nut"/>
							</g:if>
							<g:else>
								-
							</g:else>
						</td>
						
						<td>
							${nutInstance.countVendor(params.branch)}
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nutInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
