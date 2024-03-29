<%@ page import="th.ac.chula.bsd.security.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.selectRole.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="/layouts/submenu" />
		</content>
		<content tag="content">
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.selectRole.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<%-- TODO Assign --%>
					<g:actionSubmit class="save" action="addRole" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
		</content>
	</body>
</html>