
<%@ page import="th.ac.chula.bsd.security.UserRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="submenu" />
		</content>
		<content tag="content">
		<div id="list-userRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="userRole.user.label" default="User" /></th>
					
						<th><g:message code="userRole.role.label" default="Role" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userRoleInstanceList}" status="i" var="userRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userRoleInstance.user.id}">${fieldValue(bean: userRoleInstance, field: "user.username")}</g:link></td>
					
						<td>${fieldValue(bean: userRoleInstance, field: "role.authority")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userRoleInstanceCount ?: 0}" />
			</div>
		</div>
		</content>
	</body>
</html>
