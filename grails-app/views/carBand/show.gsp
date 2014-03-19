
<%@ page import="th.ac.chula.bsd.wheel.CarBand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'carBand.label', default: 'CarBand')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-carBand" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carBand">
			
				<g:if test="${carBandInstance?.bandName}">
				<li class="fieldcontain">
					<span id="bandName-label" class="property-label"><g:message code="carBand.bandName.label" default="ยี่ห้อรถ" /></span>
					
						<span class="property-value" aria-labelledby="bandName-label"><g:fieldValue bean="${carBandInstance}" field="bandName"/></span>
					
				</li>
				</g:if>
			
			<%-- <g:if test="${carBandInstance?.dWheel}">
				<li class="fieldcontain">
					<span id="dWheel-label" class="property-label"><g:message code="carBand.dWheel.label" default="DW heel" /></span>
					
						<g:each in="${carBandInstance.dWheel}" var="d">
						<span class="property-value" aria-labelledby="dWheel-label"><g:link controller="defaultWheel" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carBandInstance?.models}">
				<li class="fieldcontain">
					<span id="models-label" class="property-label"><g:message code="carBand.models.label" default="Models" /></span>
					
						<g:each in="${carBandInstance.models}" var="m">
						<span class="property-value" aria-labelledby="models-label"><g:link controller="carModel" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--%>	
			
			</ol>
			<g:form url="[resource:carBandInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carBandInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
