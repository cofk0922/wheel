
<%@ page import="th.ac.chula.bsd.wheel.CarColor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-car" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list car">
			
				<g:if test="${carInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="car.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${carInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.carImage}">
				<li class="fieldcontain">
					<span id="carImage-label" class="property-label"><g:message code="carModel.carImage.label" default="Car Image" /></span>
					
						<span class="property-value" aria-labelledby="carImage-label"><g:fieldValue bean="${carModelInstance}" field="carImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.backHeight}">
				<li class="fieldcontain">
					<span id="backHeight-label" class="property-label"><g:message code="carModel.backHeight.label" default="Back Height" /></span>
					
						<span class="property-value" aria-labelledby="backHeight-label"><g:fieldValue bean="${carModelInstance}" field="backHeight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.backWidth}">
				<li class="fieldcontain">
					<span id="backWidth-label" class="property-label"><g:message code="carModel.backWidth.label" default="Back Width" /></span>
					
						<span class="property-value" aria-labelledby="backWidth-label"><g:fieldValue bean="${carModelInstance}" field="backWidth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.backX1}">
				<li class="fieldcontain">
					<span id="backX1-label" class="property-label"><g:message code="carModel.backX1.label" default="Back X1" /></span>
					
						<span class="property-value" aria-labelledby="backX1-label"><g:fieldValue bean="${carModelInstance}" field="backX1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.backX2}">
				<li class="fieldcontain">
					<span id="backX2-label" class="property-label"><g:message code="carModel.backX2.label" default="Back X2" /></span>
					
						<span class="property-value" aria-labelledby="backX2-label"><g:fieldValue bean="${carModelInstance}" field="backX2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.backY}">
				<li class="fieldcontain">
					<span id="backY-label" class="property-label"><g:message code="carModel.backY.label" default="Back Y" /></span>
					
						<span class="property-value" aria-labelledby="backY-label"><g:fieldValue bean="${carModelInstance}" field="backY"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.backY1}">
				<li class="fieldcontain">
					<span id="backY1-label" class="property-label"><g:message code="carModel.backY1.label" default="Back Y1" /></span>
					
						<span class="property-value" aria-labelledby="backY1-label"><g:fieldValue bean="${carModelInstance}" field="backY1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.frontHeight}">
				<li class="fieldcontain">
					<span id="frontHeight-label" class="property-label"><g:message code="carModel.frontHeight.label" default="Front Height" /></span>
					
						<span class="property-value" aria-labelledby="frontHeight-label"><g:fieldValue bean="${carModelInstance}" field="frontHeight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.frontWidth}">
				<li class="fieldcontain">
					<span id="frontWidth-label" class="property-label"><g:message code="carModel.frontWidth.label" default="Front Width" /></span>
					
						<span class="property-value" aria-labelledby="frontWidth-label"><g:fieldValue bean="${carModelInstance}" field="frontWidth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.frontX1}">
				<li class="fieldcontain">
					<span id="frontX1-label" class="property-label"><g:message code="carModel.frontX1.label" default="Front X1" /></span>
					
						<span class="property-value" aria-labelledby="frontX1-label"><g:fieldValue bean="${carModelInstance}" field="frontX1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.frontX2}">
				<li class="fieldcontain">
					<span id="frontX2-label" class="property-label"><g:message code="carModel.frontX2.label" default="Front X2" /></span>
					
						<span class="property-value" aria-labelledby="frontX2-label"><g:fieldValue bean="${carModelInstance}" field="frontX2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.frontY1}">
				<li class="fieldcontain">
					<span id="frontY1-label" class="property-label"><g:message code="carModel.frontY1.label" default="Front Y1" /></span>
					
						<span class="property-value" aria-labelledby="frontY1-label"><g:fieldValue bean="${carModelInstance}" field="frontY1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.frontY2}">
				<li class="fieldcontain">
					<span id="frontY2-label" class="property-label"><g:message code="carModel.frontY2.label" default="Front Y2" /></span>
					
						<span class="property-value" aria-labelledby="frontY2-label"><g:fieldValue bean="${carModelInstance}" field="frontY2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.hVal}">
				<li class="fieldcontain">
					<span id="hVal-label" class="property-label"><g:message code="carModel.hVal.label" default="HV al" /></span>
					
						<span class="property-value" aria-labelledby="hVal-label"><g:fieldValue bean="${carModelInstance}" field="hVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.sVal}">
				<li class="fieldcontain">
					<span id="sVal-label" class="property-label"><g:message code="carModel.sVal.label" default="SV al" /></span>
					
						<span class="property-value" aria-labelledby="sVal-label"><g:fieldValue bean="${carModelInstance}" field="sVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.vVal}">
				<li class="fieldcontain">
					<span id="vVal-label" class="property-label"><g:message code="carModel.vVal.label" default="VV al" /></span>
					
						<span class="property-value" aria-labelledby="vVal-label"><g:fieldValue bean="${carModelInstance}" field="vVal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.hexVal}">
				<li class="fieldcontain">
					<span id="hexVal-label" class="property-label"><g:message code="carModel.hexVal.label" default="Hex Val" /></span>
					
						<span class="property-value" aria-labelledby="hexVal-label"><g:fieldValue bean="${carModelInstance}" field="hexVal"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
