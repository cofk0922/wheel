<%@ page import="th.ac.chula.bsd.wheel.CarWheelList" %>



<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'car', 'error')} required">
	<label for="car">
		<g:message code="carWheelList.car.label" default="Car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="car" name="car.id" from="${th.ac.chula.bsd.wheel.Car.list()}" optionKey="id" required="" value="${carWheelListInstance?.car?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'driveStar', 'error')} required">
	<label for="driveStar">
		<g:message code="carWheelList.driveStar.label" default="Drive Star" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="driveStar" type="number" value="${carWheelListInstance.driveStar}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'drivingEnergy', 'error')} required">
	<label for="drivingEnergy">
		<g:message code="carWheelList.drivingEnergy.label" default="Driving Energy" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="drivingEnergy" value="${fieldValue(bean: carWheelListInstance, field: 'drivingEnergy')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'listOrder', 'error')} required">
	<label for="listOrder">
		<g:message code="carWheelList.listOrder.label" default="List Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="listOrder" type="number" value="${carWheelListInstance.listOrder}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'tractiveEnergy', 'error')} required">
	<label for="tractiveEnergy">
		<g:message code="carWheelList.tractiveEnergy.label" default="Tractive Energy" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tractiveEnergy" value="${fieldValue(bean: carWheelListInstance, field: 'tractiveEnergy')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'tractiveStar', 'error')} required">
	<label for="tractiveStar">
		<g:message code="carWheelList.tractiveStar.label" default="Tractive Star" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tractiveStar" type="number" value="${carWheelListInstance.tractiveStar}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'usageScore', 'error')} required">
	<label for="usageScore">
		<g:message code="carWheelList.usageScore.label" default="Usage Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="usageScore" type="number" value="${carWheelListInstance.usageScore}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'usageType', 'error')} ">
	<label for="usageType">
		<g:message code="carWheelList.usageType.label" default="Usage Type" />
		
	</label>
	<g:textField name="usageType" value="${carWheelListInstance?.usageType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carWheelListInstance, field: 'wheel', 'error')} required">
	<label for="wheel">
		<g:message code="carWheelList.wheel.label" default="Wheel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wheel" name="wheel.id" from="${th.ac.chula.bsd.wheel.MaxWheel.list()}" optionKey="id" required="" value="${carWheelListInstance?.wheel?.id}" class="many-to-one"/>
</div>

