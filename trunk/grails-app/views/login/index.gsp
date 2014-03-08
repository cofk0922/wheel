
<%@ page import="th.ac.chula.bsd.security.Login" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'login.label', default: 'Login')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<!-- May -->
		<div id="create-endUser" class="content scaffold-create" role="main">
			<h1>Login</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance }" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError }">data-field-id=${error.field }</g:if>><g:message error="${error}" /></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form action="authenticate">
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error') }">
						<label for="username">
							<g:message code="endUser.username.lable" default="User Name"/>
						</label>
						<g:textField name="username" value="${userInstance?.username }"/>
					</div>
				
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error') }">
						<label for="password">
							<g:message code="endUser.password.lable" default="Password"/>
						</label>
						<g:field type="password" name="password" value="${userInstance?.password }"/>
					</div>
				
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton value="Login" name="login" class="save" />
				</fieldset>
			</g:form>
		</div>
	<!--
		<a href="#list-login" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-login" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${loginInstanceList}" status="i" var="loginInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${loginInstanceCount ?: 0}" />
			</div>
		</div>
		 -->
	</body>
</html>
