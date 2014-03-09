
<%@ page import="th.ac.chula.bsd.wheel.CarWheelList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carWheelList.label', default: 'CarWheelList')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-carWheelList" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-carWheelList" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carWheelList">
			
				<g:if test="${carWheelListInstance?.car}">
				<li class="fieldcontain">
					<span id="car-label" class="property-label"><g:message code="carWheelList.car.label" default="Car" /></span>
					
						<span class="property-value" aria-labelledby="car-label"><g:link controller="carModel" action="show" id="${carWheelListInstance?.car?.id}">${carWheelListInstance?.car?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.driveStar}">
				<li class="fieldcontain">
					<span id="driveStar-label" class="property-label"><g:message code="carWheelList.driveStar.label" default="Drive Star" /></span>
					
						<span class="property-value" aria-labelledby="driveStar-label"><g:fieldValue bean="${carWheelListInstance}" field="driveStar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.drivingEnergy}">
				<li class="fieldcontain">
					<span id="drivingEnergy-label" class="property-label"><g:message code="carWheelList.drivingEnergy.label" default="Driving Energy" /></span>
					
						<span class="property-value" aria-labelledby="drivingEnergy-label"><g:fieldValue bean="${carWheelListInstance}" field="drivingEnergy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.listOrder}">
				<li class="fieldcontain">
					<span id="listOrder-label" class="property-label"><g:message code="carWheelList.listOrder.label" default="List Order" /></span>
					
						<span class="property-value" aria-labelledby="listOrder-label"><g:fieldValue bean="${carWheelListInstance}" field="listOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.tractiveEnergy}">
				<li class="fieldcontain">
					<span id="tractiveEnergy-label" class="property-label"><g:message code="carWheelList.tractiveEnergy.label" default="Tractive Energy" /></span>
					
						<span class="property-value" aria-labelledby="tractiveEnergy-label"><g:fieldValue bean="${carWheelListInstance}" field="tractiveEnergy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.tractiveStar}">
				<li class="fieldcontain">
					<span id="tractiveStar-label" class="property-label"><g:message code="carWheelList.tractiveStar.label" default="Tractive Star" /></span>
					
						<span class="property-value" aria-labelledby="tractiveStar-label"><g:fieldValue bean="${carWheelListInstance}" field="tractiveStar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.usageScore}">
				<li class="fieldcontain">
					<span id="usageScore-label" class="property-label"><g:message code="carWheelList.usageScore.label" default="Usage Score" /></span>
					
						<span class="property-value" aria-labelledby="usageScore-label"><g:fieldValue bean="${carWheelListInstance}" field="usageScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.usageType}">
				<li class="fieldcontain">
					<span id="usageType-label" class="property-label"><g:message code="carWheelList.usageType.label" default="Usage Type" /></span>
					
						<span class="property-value" aria-labelledby="usageType-label"><g:fieldValue bean="${carWheelListInstance}" field="usageType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carWheelListInstance?.wheel}">
				<li class="fieldcontain">
					<span id="wheel-label" class="property-label"><g:message code="carWheelList.wheel.label" default="Wheel" /></span>
					
						<span class="property-value" aria-labelledby="wheel-label"><g:link controller="maxWheel" action="show" id="${carWheelListInstance?.wheel?.id}">${carWheelListInstance?.wheel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carWheelListInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carWheelListInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
