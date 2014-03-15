
<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carModel.label', default: 'CarModel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-carModel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-carModel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carModel">
			
				<g:if test="${carModelInstance?.band}">
				<li class="fieldcontain">
					<span id="band-label" class="property-label"><g:message code="carModel.band.label" default="Band" /></span>
					
						<span class="property-value" aria-labelledby="band-label"><g:link controller="carBand" action="show" id="${carModelInstance?.band?.id}">${carModelInstance?.band?.bandName}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.model}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="carModel.model.label" default="Model" /></span>
					
						<span class="property-value" aria-labelledby="model-label"><g:fieldValue bean="${carModelInstance}" field="model"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="carModel.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${carModelInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.defaultTireSize}">
				<li class="fieldcontain">
					<span id="defaultTireSize-label" class="property-label"><g:message code="carModel.defaultTireSize.label" default="Default Tire Size" /></span>
					
						<span class="property-value" aria-labelledby="defaultTireSize-label"><g:fieldValue bean="${carModelInstance}" field="defaultTireSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.gearRatio}">
				<li class="fieldcontain">
					<span id="gearRatio-label" class="property-label"><g:message code="carModel.gearRatio.label" default="Gear Ratio" /></span>
					
						<span class="property-value" aria-labelledby="gearRatio-label"><g:fieldValue bean="${carModelInstance}" field="gearRatio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.offSet}">
				<li class="fieldcontain">
					<span id="offSet-label" class="property-label"><g:message code="carModel.offSet.label" default="Off Set" /></span>
					
						<span class="property-value" aria-labelledby="offSet-label"><g:fieldValue bean="${carModelInstance}" field="offSet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.pcdCode}">
				<li class="fieldcontain">
					<span id="pcdCode-label" class="property-label"><g:message code="carModel.pcdCode.label" default="Pcd Code" /></span>
					
						<span class="property-value" aria-labelledby="pcdCode-label"><g:fieldValue bean="${carModelInstance}" field="pcdCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="carModel.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${carModelInstance}" field="weight"/></span>
					
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
			
				<g:if test="${carModelInstance?.wheelLists}">
				<li class="fieldcontain">
					<span id="wheelLists-label" class="property-label"><g:message code="carModel.wheelLists.label" default="Wheel Lists" /></span>
					
						<g:each in="${carModelInstance.wheelLists}" var="w">
						<span class="property-value" aria-labelledby="wheelLists-label"><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carModelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carModelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>