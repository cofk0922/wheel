<%@ page import="th.ac.chula.bsd.wheel.OrderAndTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'orderAndTransfer.label', default: 'OrderAndTransfer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="edit-orderAndTransfer" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${orderAndTransferInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${orderAndTransferInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:orderAndTransferInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${orderAndTransferInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
