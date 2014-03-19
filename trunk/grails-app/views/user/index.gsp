
<%@ page import="th.ac.chula.bsd.security.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="/layouts/submenu" />
		</content>
		<content tag="content">
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="firstname" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
						
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
						
						<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />
						
						<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
										
						<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "firstName")}</td>
						
						<td>${fieldValue(bean: userInstance, field: "lastName")}</td>
						
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
						
						<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
						
						<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>
						
						<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
		</content>
	</body>
</html>
