
<%@ page import="th.ac.chula.bsd.inventory.PreProductTransferLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'preProductTransferLine.label', default: 'PreProductTransferLine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="submenu" />
		</content>
		<content tag="content">
		<div id="list-preProductTransferLine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<span>
				<g:link action="index" params="[isViewNew:true]"><g:message code="preProductTransferLine.submenu.listPreTran.statusNew.label" /></g:link>
				|
				<g:link action="index" params="[isViewWait:true]"><g:message code="preProductTransferLine.submenu.listPreTran.statusWait.label"/></g:link>
				|
				<g:link action="index" params="[isViewComplete:true]"><g:message code="preProductTransferLine.submenu.listPreTran.statusComplete.label" /></g:link>
			</span>
			<table>
			<thead>
					<tr>
						<th><g:message code="preProductTransferLine.appointment.label" default="Appointment" /></th>
						
						<th><g:message code="preProductTransferLine.product.label" default="Product" /></th>
					
						<g:sortableColumn property="amount" title="${message(code: 'preProductTransferLine.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'preProductTransferLine.status.label', default: 'Status')}" />
						
						<g:if test="${params.isViewNew}">
							<th><g:message code="preProductTransferLine.suggestBranch.label" default="Branch" /></th>
					
							<th></th>
						</g:if>
					</tr>
				</thead>
				<tbody>
				<g:each in="${preProductTransferLineInstanceList}" status="i" var="preProductTransferLineInstance">
				<g:set var="suggestBranch" value="${(preProductTransferLineInstance.getSuggestBranchTransfer()).id}" />
				<g:form url="[resource:preProductTransferLineInstance, params:[suggestBranch:suggestBranch], action:'requestTransfer']" method="PUT">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: preProductTransferLineInstance, field: "appointment")}</td>
					
						<!-- <td><g:link action="show" id="${preProductTransferLineInstance.id}">${fieldValue(bean: preProductTransferLineInstance, field: "product")}</g:link></td> -->
						<td>${fieldValue(bean: preProductTransferLineInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: preProductTransferLineInstance, field: "amount")}</td>

						<td>${fieldValue(bean: preProductTransferLineInstance, field: "status")}</td>
					
						<g:if test="${params.isViewNew}">
							<td>${preProductTransferLineInstance.getSuggestBranchTransfer() }</td>
					
							<td><g:submitButton name="requestTransfer" value="${message(code: 'preProductTransferLine.requestTransfer.label') }" /></td>
						</g:if>
					</tr>
					</g:form>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${preProductTransferLineInstanceCount ?: 0}" />
			</div>
		</div>
		</content>
	</body>
</html>
