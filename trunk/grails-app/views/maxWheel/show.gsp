<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'maxWheel.label', default: 'MaxWheel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="show-maxWheel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maxWheel">
			
				<g:if test="${maxWheelInstance?.band}">
				<li class="fieldcontain">
					<span id="band-label" class="property-label"><g:message code="maxWheel.band.label" default="ยี่ห้อ" /></span>
					
						<span class="property-value" aria-labelledby="band-label"><g:link controller="wheelBand" action="show" id="${maxWheelInstance?.band?.id}">${maxWheelInstance?.band?.name}</g:link></span>
					
				</li>
				</g:if>
						
				<g:if test="${maxWheelInstance?.modelName}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="maxWheel.modelName.label" default="ชื่อรุ่นล้อแม็กซ์" /></span>
					
						<span class="property-value" aria-labelledby="modelName-label"><g:fieldValue bean="${maxWheelInstance}" field="modelName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.series}">
				<li class="fieldcontain">
					<span id="model-label" class="property-label"><g:message code="maxWheel.series.label" default="ซีรี่ย์" /></span>
					
						<span class="property-value" aria-labelledby="series-label"><g:fieldValue bean="${maxWheelInstance}" field="series"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.size}">
				<li class="fieldcontain">
					<span id="size-label" class="property-label"><g:message code="maxWheel.size.label" default="ขนาด" /></span>
					
						<span class="property-value" aria-labelledby="size-label"><g:fieldValue bean="${maxWheelInstance}" field="size"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.width}">
				<li class="fieldcontain">
					<span id="width-label" class="property-label"><g:message code="maxWheel.width.label" default="หน้ากว้าง" /></span>
					
						<span class="property-value" aria-labelledby="width-label"><g:fieldValue bean="${maxWheelInstance}" field="width"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="maxWheel.weight.label" default="น้ำหนัก" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${maxWheelInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.pcdCode}">
				<li class="fieldcontain">
					<span id="pcdCode-label" class="property-label"><g:message code="maxWheel.pcdCode.label" default="รหัสการจัดเรียงรูน๊อต PCD" /></span>
					
						<span class="property-value" aria-labelledby="pcdCode-label"><g:fieldValue bean="${maxWheelInstance}" field="pcdCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.offSet}">
				<li class="fieldcontain">
					<span id="offSet-label" class="property-label"><g:message code="maxWheel.offSet.label" default="ระยะห่างแกนเพลาถึงขอบรถ" /></span>
					
						<span class="property-value" aria-labelledby="offSet-label"><g:fieldValue bean="${maxWheelInstance}" field="offSet"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.pStatus}">
				<li class="fieldcontain">
					<span id="pStatus-label" class="property-label"><g:message code="maxWheel.pStatus.label" default="สถานะการผลิต" /></span>
					
						<span class="property-value" aria-labelledby="pStatus-label"><g:fieldValue bean="${maxWheelInstance}" field="pStatus"/></span>
					
				</li>
				</g:if>
			
			<%--<g:if test="${maxWheelInstance?.productStocks}">
				<li class="fieldcontain">
					<span id="productStocks-label" class="property-label"><g:message code="maxWheel.productStocks.label" default="Product Stocks" /></span>
					
						<g:each in="${maxWheelInstance.productStocks}" var="p">
						<span class="property-value" aria-labelledby="productStocks-label"><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${maxWheelInstance?.productType}">
				<li class="fieldcontain">
					<span id="productType-label" class="property-label"><g:message code="maxWheel.productType.label" default="Product Type" /></span>
					
						<span class="property-value" aria-labelledby="productType-label"><g:fieldValue bean="${maxWheelInstance}" field="productType"/></span>
					
				</li>
				</g:if> 	
			
				<g:if test="${maxWheelInstance?.productVendorTransfers}">
				<li class="fieldcontain">
					<span id="productVendorTransfers-label" class="property-label"><g:message code="maxWheel.productVendorTransfers.label" default="Product Vendor Transfers" /></span>
					
						<g:each in="${maxWheelInstance.productVendorTransfers}" var="p">
						<span class="property-value" aria-labelledby="productVendorTransfers-label"><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>--%>
			
				<g:if test="${maxWheelInstance?.spoke}">
				<li class="fieldcontain">
					<span id="spoke-label" class="property-label"><g:message code="maxWheel.spoke.label" default="ชนิดของก้านล้อแม็กซ์" /></span>
					
						<span class="property-value" aria-labelledby="spoke-label"><g:fieldValue bean="${maxWheelInstance}" field="spoke"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${maxWheelInstance?.forCarBand}">
				<li class="fieldcontain">
					<span id="forCarBand-label" class="property-label"><g:message code="maxWheel.forCarBand.label" default="ยี่ห้อ" /></span>
					
						<span class="property-value" aria-labelledby="forCarBand-label"><g:link controller="wheelBand" action="show" id="${maxWheelInstance?.forCarBand?.id}">${maxWheelInstance?.forCarBand?.bandName}</g:link></span>
					
				</li>
				</g:if>
			
				<%--<g:if test="${maxWheelInstance?.wheelLists}">
				<li class="fieldcontain">
					<span id="wheelLists-label" class="property-label"><g:message code="maxWheel.wheelLists.label" default="Wheel Lists" /></span>
					
						<g:each in="${maxWheelInstance.wheelLists}" var="w">
						<span class="property-value" aria-labelledby="wheelLists-label"><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if> --%>
			
			</ol>
			<g:form url="[resource:maxWheelInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="list" action="detectColor" controller="maxWheel" params="${[wheelID:maxWheelInstance.id]}"><g:message code="maxWheel.detectColor.label" /></g:link>
					<g:link class="edit" action="edit" resource="${maxWheelInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
