
<%@ page import="th.ac.chula.bsd.wheel.Vendor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-vendor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="vendorName" title="${message(code: 'vendor.vendorName.label', default: 'Vendor Name')}" />
					
						<g:sortableColumn property="vendorAddress" title="${message(code: 'vendor.vendorAddress.label', default: 'Vendor Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vendorInstanceList}" status="i" var="vendorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vendorInstance.id}">${fieldValue(bean: vendorInstance, field: "vendorName")}</g:link></td>
					
						<td>${fieldValue(bean: vendorInstance, field: "vendorAddress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vendorInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
