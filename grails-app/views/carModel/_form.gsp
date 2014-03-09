<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>



<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'band', 'error')} ">
	<label for="band">
		<g:message code="carModel.band.label" default="Band" />
		
	</label>
	<g:textField name="band" value="${carModelInstance?.band}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'model', 'error')} ">
	<label for="model">
		<g:message code="carModel.model.label" default="Model" />
		
	</label>
	<g:textField name="model" value="${carModelInstance?.model}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'pcdCode', 'error')} ">
	<label for="pcdCode">
		<g:message code="carModel.pcdCode.label" default="Pcd Code" />
		
	</label>
	<g:textField name="pcdCode" value="${carModelInstance?.pcdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'defaultTireSize', 'error')} required">
	<label for="defaultTireSize">
		<g:message code="carModel.defaultTireSize.label" default="Default Tire Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="defaultTireSize" type="number" value="${carModelInstance.defaultTireSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'defaultWheel', 'error')} required">
	<label for="defaultWheel">
		<g:message code="carModel.defaultWheel.label" default="Default Wheel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="defaultWheel" name="defaultWheel.id" from="${th.ac.chula.bsd.wheel.MaxWheel.list()}" optionKey="id" required="" value="${carModelInstance?.defaultWheel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'gearRatio', 'error')} required">
	<label for="gearRatio">
		<g:message code="carModel.gearRatio.label" default="Gear Ratio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gearRatio" value="${fieldValue(bean: carModelInstance, field: 'gearRatio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'offSet', 'error')} required">
	<label for="offSet">
		<g:message code="carModel.offSet.label" default="Off Set" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offSet" value="${fieldValue(bean: carModelInstance, field: 'offSet')}" required=""/>
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

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'wheelSpace', 'error')} required">
	<label for="wheelSpace">
		<g:message code="carModel.wheelSpace.label" default="Wheel Space" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wheelSpace" value="${fieldValue(bean: carModelInstance, field: 'wheelSpace')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="carModel.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${carModelInstance.year}" required=""/>
</div>

