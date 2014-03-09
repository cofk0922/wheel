
<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>
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
			
				<g:if test="${carInstance?.band}">
				<li class="fieldcontain">
					<span id="band-label" class="property-label"><g:message code="car.band.label" default="Band" /></span>
					
						<span class="property-value" aria-labelledby="band-label"><g:fieldValue bean="${carInstance}" field="band"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="car.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${carInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.pcdCode}">
				<li class="fieldcontain">
					<span id="pcdCode-label" class="property-label"><g:message code="car.pcdCode.label" default="Pcd Code" /></span>
					
						<span class="property-value" aria-labelledby="pcdCode-label"><g:fieldValue bean="${carInstance}" field="pcdCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.defaultTireSize}">
				<li class="fieldcontain">
					<span id="defaultTireSize-label" class="property-label"><g:message code="car.defaultTireSize.label" default="Default Tire Size" /></span>
					
						<span class="property-value" aria-labelledby="defaultTireSize-label"><g:fieldValue bean="${carInstance}" field="defaultTireSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.defaultWheel}">
				<li class="fieldcontain">
					<span id="defaultWheel-label" class="property-label"><g:message code="car.defaultWheel.label" default="Default Wheel" /></span>
					
						<span class="property-value" aria-labelledby="defaultWheel-label"><g:link controller="maxWheel" action="show" id="${carInstance?.defaultWheel?.id}">${carInstance?.defaultWheel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.gearRatio}">
				<li class="fieldcontain">
					<span id="gearRatio-label" class="property-label"><g:message code="car.gearRatio.label" default="Gear Ratio" /></span>
					
						<span class="property-value" aria-labelledby="gearRatio-label"><g:fieldValue bean="${carInstance}" field="gearRatio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.offSet}">
				<li class="fieldcontain">
					<span id="offSet-label" class="property-label"><g:message code="car.offSet.label" default="Off Set" /></span>
					
						<span class="property-value" aria-labelledby="offSet-label"><g:fieldValue bean="${carInstance}" field="offSet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="car.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${carInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.wheelLists}">
				<li class="fieldcontain">
					<span id="wheelLists-label" class="property-label"><g:message code="car.wheelLists.label" default="Wheel Lists" /></span>
					
						<g:each in="${carInstance.wheelLists}" var="w">
						<span class="property-value" aria-labelledby="wheelLists-label"><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.wheelSpace}">
				<li class="fieldcontain">
					<span id="wheelSpace-label" class="property-label"><g:message code="car.wheelSpace.label" default="Wheel Space" /></span>
					
						<span class="property-value" aria-labelledby="wheelSpace-label"><g:fieldValue bean="${carInstance}" field="wheelSpace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="car.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${carInstance}" field="year"/></span>
					
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
