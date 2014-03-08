<%@ page import="th.ac.chula.bsd.wheel.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'band', 'error')} ">
	<label for="band">
		<g:message code="car.band.label" default="Band" />
		
	</label>
	<g:textField name="band" value="${carInstance?.band}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'model', 'error')} ">
	<label for="model">
		<g:message code="car.model.label" default="Model" />
		
	</label>
	<g:textField name="model" value="${carInstance?.model}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'pcdCode', 'error')} ">
	<label for="pcdCode">
		<g:message code="car.pcdCode.label" default="Pcd Code" />
		
	</label>
	<g:textField name="pcdCode" value="${carInstance?.pcdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'defaultWheel', 'error')} required">
	<label for="defaultWheel">
		<g:message code="car.defaultWheel.label" default="Default Wheel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="defaultWheel" name="defaultWheel.id" from="${th.ac.chula.bsd.wheel.MaxWheel.list()}" optionKey="id" required="" value="${carInstance?.defaultWheel?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'gearRatio', 'error')} required">
	<label for="gearRatio">
		<g:message code="car.gearRatio.label" default="Gear Ratio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gearRatio" value="${fieldValue(bean: carInstance, field: 'gearRatio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'offSet', 'error')} required">
	<label for="offSet">
		<g:message code="car.offSet.label" default="Off Set" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offSet" value="${fieldValue(bean: carInstance, field: 'offSet')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="car.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: carInstance, field: 'weight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'wheelLists', 'error')} ">
	<label for="wheelLists">
		<g:message code="car.wheelLists.label" default="Wheel Lists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carInstance?.wheelLists?}" var="w">
    <li><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carWheelList" action="create" params="['car.id': carInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carWheelList.label', default: 'CarWheelList')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'wheelSpace', 'error')} required">
	<label for="wheelSpace">
		<g:message code="car.wheelSpace.label" default="Wheel Space" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wheelSpace" value="${fieldValue(bean: carInstance, field: 'wheelSpace')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="car.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${carInstance.year}" required=""/>
</div>

