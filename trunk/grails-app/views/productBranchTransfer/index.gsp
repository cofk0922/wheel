
<%@ page import="th.ac.chula.bsd.wheel.ProductBranchTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productBranchTransfer.label', default: 'ProductBranchTransfer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-productBranchTransfer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="productBranchTransfer.branchFrom.label" default="Branch From" /></th>
					
						<%--<th><g:message code="productBranchTransfer.branchTo.label" default="Branch To" /></th> --%>
					
						<g:sortableColumn property="transferDay" title="${message(code: 'productBranchTransfer.transferDay.label', default: 'Transfer Day')}" />
					
						<g:sortableColumn property="transferHour" title="${message(code: 'productBranchTransfer.transferHour.label', default: 'Transfer Hour')}" />
					
						<g:sortableColumn property="transferMinute" title="${message(code: 'productBranchTransfer.transferMinute.label', default: 'Transfer Minute')}" />
						
						<g:sortableColumn property="enable" title="${message(code: 'productBranchTransfer.enable.label', default:' Enabled') }" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productBranchTransferInstanceList}" status="i" var="productBranchTransferInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productBranchTransferInstance.id}">${fieldValue(bean: productBranchTransferInstance, field: "branchFrom")}</g:link></td>
					
						<%--<td>${fieldValue(bean: productBranchTransferInstance, field: "branchTo")}</td> --%>
					
						<td>
							${fieldValue(bean: productBranchTransferInstance, field: "transferDay")}
							<g:message code="default.day" />
						</td>
					
						<td>
							${fieldValue(bean: productBranchTransferInstance, field: "transferHour")}
							<g:message code="default.hour" />
						</td>
					
						<td>
							${fieldValue(bean: productBranchTransferInstance, field: "transferMinute")}
							<g:message code="default.minute" />
						</td>
					
						<td><g:formatBoolean boolean="${productBranchTransferInstance.enable}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productBranchTransferInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
