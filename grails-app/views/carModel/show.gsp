
<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'carModel.label', default: 'CarModel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-carModel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carModel">
			
				<g:if test="${carModelInstance?.band}">
				<li class="fieldcontain">
					<span id="band-label" class="property-label"><g:message code="carModel.band.label" default="ยี่ห้อ" /></span>
					
						<span class="property-value" aria-labelledby="band-label"><g:link controller="carBand" action="show" id="${carModelInstance?.band?.id}">${carModelInstance?.band?.bandName}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.modelName}">
				<li class="fieldcontain">
					<span id="modelName-label" class="property-label"><g:message code="carModel.modelName.label" default="รุ่น" /></span>
					
						<span class="property-value" aria-labelledby="modelName-label"><g:fieldValue bean="${carModelInstance}" field="modelName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="carModel.year.label" default="ปี" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${carModelInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.defaultTireSize}">
				<li class="fieldcontain">
					<span id="defaultTireSize-label" class="property-label"><g:message code="carModel.defaultTireSize.label" default="ขนาดล้อพร้อมยางมาตรฐาน" /></span>
					
						<span class="property-value" aria-labelledby="defaultTireSize-label"><g:fieldValue bean="${carModelInstance}" field="defaultTireSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.gearRatio}">
				<li class="fieldcontain">
					<span id="gearRatio-label" class="property-label"><g:message code="carModel.gearRatio.label" default="อัตราการทดแรงเกียร์พื้นฐาน(เท่า)" /></span>
					
						<span class="property-value" aria-labelledby="gearRatio-label"><g:fieldValue bean="${carModelInstance}" field="gearRatio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.offSet}">
				<li class="fieldcontain">
					<span id="offSet-label" class="property-label"><g:message code="carModel.offSet.label" default="ระยะห่างแกนเพลาถึงขอบรถ" /></span>
					
						<span class="property-value" aria-labelledby="offSet-label"><g:fieldValue bean="${carModelInstance}" field="offSet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.pcdCode}">
				<li class="fieldcontain">
					<span id="pcdCode-label" class="property-label"><g:message code="carModel.pcdCode.label" default="รหัสการจัดเรียงรูน๊อต PCD" /></span>
					
						<span class="property-value" aria-labelledby="pcdCode-label"><g:fieldValue bean="${carModelInstance}" field="pcdCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="carModel.weight.label" default="น้ำหนักรถ(กิโลกรัม)" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${carModelInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carModelInstance?.nutSize}">
				<li class="fieldcontain">
					<span id="nutSize-label" class="property-label"><g:message code="carModel.nutSize.label" default="ขนาดเกลียวน๊อต(มิลลิเมตร)" /></span>
					
						<span class="property-value" aria-labelledby="nutSize-label"><g:fieldValue bean="${carModelInstance}" field="nutSize"/></span>
					
				</li>
				</g:if>
			
				<%-- <g:if test="${carModelInstance?.wheelLists}">
				<li class="fieldcontain">
					<span id="wheelLists-label" class="property-label"><g:message code="carModel.wheelLists.label" default="Wheel Lists" /></span>
					
						<g:each in="${carModelInstance.wheelLists}" var="w">
						<span class="property-value" aria-labelledby="wheelLists-label"><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if> --%>
			
			</ol>
			<g:form url="[resource:carModelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carModelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
