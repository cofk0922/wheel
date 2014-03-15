<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>



<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'backHeight', 'error')} required">
	<label for="backHeight">
		<g:message code="carModel.backHeight.label" default="Back Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backHeight" type="number" value="${carModelInstance.backHeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'backWidth', 'error')} required">
	<label for="backWidth">
		<g:message code="carModel.backWidth.label" default="Back Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backWidth" type="number" value="${carModelInstance.backWidth}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'backX1', 'error')} required">
	<label for="backX1">
		<g:message code="carModel.backX1.label" default="Back X1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backX1" type="number" value="${carModelInstance.backX1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'backX2', 'error')} required">
	<label for="backX2">
		<g:message code="carModel.backX2.label" default="Back X2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backX2" type="number" value="${carModelInstance.backX2}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'backY', 'error')} required">
	<label for="backY">
		<g:message code="carModel.backY.label" default="Back Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backY" type="number" value="${carModelInstance.backY}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'backY1', 'error')} required">
	<label for="backY1">
		<g:message code="carModel.backY1.label" default="Back Y1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backY1" type="number" value="${carModelInstance.backY1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'band', 'error')} required">
	<label for="band">
		<g:message code="carModel.band.label" default="Band" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="band" name="band.id" from="${th.ac.chula.bsd.wheel.CarBand.list()}" optionKey="id" optionValue="bandName" required="" value="${carModelInstance?.band?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'carImage', 'error')} ">
	<label for="carImage">
		<g:message code="carModel.carImage.label" default="Car Image" />
		
	</label>
	<g:textField name="carImage" value="${carModelInstance?.carImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'defaultTireSize', 'error')} required">
	<label for="defaultTireSize">
		<g:message code="carModel.defaultTireSize.label" default="Default Tire Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="defaultTireSize" type="number" value="${carModelInstance.defaultTireSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'frontHeight', 'error')} required">
	<label for="frontHeight">
		<g:message code="carModel.frontHeight.label" default="Front Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontHeight" type="number" value="${carModelInstance.frontHeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'frontWidth', 'error')} required">
	<label for="frontWidth">
		<g:message code="carModel.frontWidth.label" default="Front Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontWidth" type="number" value="${carModelInstance.frontWidth}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'frontX1', 'error')} required">
	<label for="frontX1">
		<g:message code="carModel.frontX1.label" default="Front X1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontX1" type="number" value="${carModelInstance.frontX1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'frontX2', 'error')} required">
	<label for="frontX2">
		<g:message code="carModel.frontX2.label" default="Front X2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontX2" type="number" value="${carModelInstance.frontX2}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'frontY1', 'error')} required">
	<label for="frontY1">
		<g:message code="carModel.frontY1.label" default="Front Y1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontY1" type="number" value="${carModelInstance.frontY1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'frontY2', 'error')} required">
	<label for="frontY2">
		<g:message code="carModel.frontY2.label" default="Front Y2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontY2" type="number" value="${carModelInstance.frontY2}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'gearRatio', 'error')} required">
	<label for="gearRatio">
		<g:message code="carModel.gearRatio.label" default="Gear Ratio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gearRatio" value="${fieldValue(bean: carModelInstance, field: 'gearRatio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'hVal', 'error')} ">
	<label for="hVal">
		<g:message code="carModel.hVal.label" default="HV al" />
		
	</label>
	<g:textField name="hVal" value="${carModelInstance?.hVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'hexVal', 'error')} ">
	<label for="hexVal">
		<g:message code="carModel.hexVal.label" default="Hex Val" />
		
	</label>
	<g:textField name="hexVal" value="${carModelInstance?.hexVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'model', 'error')} ">
	<label for="model">
		<g:message code="carModel.model.label" default="Model" />
		
	</label>
	<g:textField name="model" value="${carModelInstance?.model}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'offSet', 'error')} required">
	<label for="offSet">
		<g:message code="carModel.offSet.label" default="Off Set" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offSet" value="${fieldValue(bean: carModelInstance, field: 'offSet')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'pcdCode', 'error')} ">
	<label for="pcdCode">
		<g:message code="carModel.pcdCode.label" default="Pcd Code" />
		
	</label>
	<g:textField name="pcdCode" value="${carModelInstance?.pcdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'sVal', 'error')} ">
	<label for="sVal">
		<g:message code="carModel.sVal.label" default="SV al" />
		
	</label>
	<g:textField name="sVal" value="${carModelInstance?.sVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'vVal', 'error')} ">
	<label for="vVal">
		<g:message code="carModel.vVal.label" default="VV al" />
		
	</label>
	<g:textField name="vVal" value="${carModelInstance?.vVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="carModel.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: carModelInstance, field: 'weight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'wheelLists', 'error')} ">
	<label for="wheelLists">
		<g:message code="carModel.wheelLists.label" default="Wheel Lists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carModelInstance?.wheelLists?}" var="w">
    <li><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carWheelList" action="create" params="['carModel.id': carModelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carWheelList.label', default: 'CarWheelList')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="carModel.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${carModelInstance.year}" required=""/>
</div>

