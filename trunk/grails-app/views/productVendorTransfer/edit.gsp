<%@ page import="th.ac.chula.bsd.wheel.ProductVendorTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="submenu" />
	</content>
	<content tag="content">
		<div id="edit-productVendorTransfer" class="content scaffold-edit" role="main">
			<h1>
				<g:message code="default.edit.label" args="[entityName]" />
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${productVendorTransferInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${productVendorTransferInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:productVendorTransferInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${productVendorTransferInstance?.version}" />
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
