<%@ page import="th.ac.chula.bsd.wheel.ProductBranchTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productBranchTransfer.label', default: 'ProductBranchTransfer')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="edit-productBranchTransfer" class="content scaffold-edit" role="main">
			<h1>
				<g:message code="default.edit.label" args="[entityName]" />
				:
				<g:message code="${params.branch.branchName}" />
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${productBranchTransferInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${productBranchTransferInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:productBranchTransferInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${productBranchTransferInstance?.version}" />
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
