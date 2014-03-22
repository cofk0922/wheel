
<%@ page import="th.ac.chula.bsd.inventory.ProductTransferLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productTransferToLine.label', default: 'ProductTransferFromLine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="/preProductTransferLine/submenu" />
		</content>
		<content tag="content">
		<div id="list-productTransferLine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<span>
				<g:link action="transferto" params="[isViewTransfered:true]"><g:message code="preProductTransferLine.submenu.transferTo.statusTransfered.label" /></g:link>
				|
				<g:link action="transferto" params="[isViewNew:true]"><g:message code="preProductTransferLine.submenu.transferTo.statusNew.label"/></g:link>
				|
				<g:link action="transferto" params="[isViewReceived:true]"><g:message code="preProductTransferLine.submenu.transferTo.statusReceived.label" /></g:link>
			</span>
			<table>
			<thead>
					<tr>
						<th><g:message code="productTransferLine.branchTo.label" default="Branch To" /></th>
					
						<th><g:message code="preProductTransferLine.product.label" default="Product" /></th>
						
						<g:sortableColumn property="amount" title="${message(code: 'productTransferLine.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'productTransferLine.status.label', default: 'Status')}" />
						
						<g:if test="${params.isViewTransfered}">
							<th></th>
						</g:if>
					<%--
						<th><g:message code="productTransferLine.product.label" default="Product" /></th>
					
						<g:sortableColumn property="amount" title="${message(code: 'productTransferLine.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="createdDate" title="${message(code: 'productTransferLine.createdDate.label', default: 'Created Date')}" />
					
						<g:sortableColumn property="updatedDate" title="${message(code: 'productTransferLine.updatedDate.label', default: 'Updated Date')}" />
					
						<th><g:message code="productTransferLine.branchFrom.label" default="Branch From" /></th>
					 --%>
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productTransferLineInstanceList}" status="i" var="productTransferLineInstance">
				<g:form controller="preProductTransferLine" action="receiveTransfer" params="${[productTransferLineInstanceID:productTransferLineInstance.id] }" method="POST" >
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: productTransferLineInstance, field: "branchTo")}</td>
					
						<td><g:link action="show" id="${productTransferLineInstance.id}">${fieldValue(bean: productTransferLineInstance, field: "product")}</g:link></td>
					
						<td>${fieldValue(bean: productTransferLineInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: productTransferLineInstance, field: "status")}</td>
					
						 <%--<td>${fieldValue(bean: productTransferLineInstance, field: "branchFrom")}</td> --%>
					
						<g:if test="${params.isViewTransfered}">
							<td><g:submitButton name="receiveTransfer" value="${message(code: 'productTransferFromLine.receive.label') }" /></td>
						</g:if>
					
					</tr>
				</g:form>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productTransferLineInstanceCount ?: 0}" />
			</div>
		</div>
		</content>
	</body>
</html>
