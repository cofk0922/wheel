<%@ page import="th.ac.chula.bsd.wheel.CarModel" %>



<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'band', 'error')} required">
	<label for="band">
		<g:message code="carModel.band.label" default="ยี่ห้อ" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="band" name="band.id" from="${th.ac.chula.bsd.wheel.CarBand.list()}" optionKey="id" optionValue="bandName" required="" value="${carModelInstance?.band?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'modelName', 'error')} ">
	<label for="modelName">
		<g:message code="carModel.modelName.label" default="รุ่น" />
		
	</label>
	<g:textField name="modelName" value="${carModelInstance?.modelName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="carModel.year.label" default="ปี" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${carModelInstance.year}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'defaultTireSize', 'error')} required">
	<label for="defaultTireSize">
		<g:message code="carModel.defaultTireSize.label" default="ขนาดล้อพร้อมยางมาตรฐาน" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="defaultTireSize" type="number" value="${carModelInstance.defaultTireSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'gearRatio', 'error')} required">
	<label for="gearRatio">
		<g:message code="carModel.gearRatio.label" default="อัตราการทดแรงเกียร์พื้นฐาน(เท่า)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gearRatio" type="number" value="${fieldValue(bean: carModelInstance, field: 'gearRatio')}" step="any" required=""/>
	<g:message code="default.ratio"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'offSet', 'error')} required">
	<label for="offSet">
		<g:message code="carModel.offSet.label" default="ระยะห่างแกนเพลาถึงขอบรถ" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offSet" type="text" value="${fieldValue(bean: carModelInstance, field: 'offSet')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'pcdCode', 'error')} ">
	<label for="pcdCode">
		<g:message code="carModel.pcdCode.label" default="รหัสการจัดเรียงรูน๊อต PCD" />
		
	</label>
	<g:textField name="pcdCode" value="${carModelInstance?.pcdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="carModel.weight.label" default="น้ำหนักรถ(กิโลกรัม)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" type="number" value="${fieldValue(bean: carModelInstance, field: 'weight')}" step="any" required=""/>
	<g:message code="default.kilogram" />
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'nutSize', 'error')} required">
	<label for="nutSize">
		<g:message code="carModel.nutSize.label" default="ขนาดเกลียวน๊อต(มิลลิเมตร)" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nutSize" type="number" value="${fieldValue(bean: carModelInstance, field: 'nutSize')}" step="any" required=""/>
	<g:message code="default.millimeter"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carModelInstance, field: 'defaultWheel', 'error')} required">
	<label for="defaultWheel">
		<g:message code="carModel.defaultWheel.label" default="defaultWheel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="defaultWheel" name="defaultWheel.id" from="${th.ac.chula.bsd.wheel.MaxWheel.list()}" optionKey="id" optionValue="prodName" required="" value="${carModelInstance?.defaultWheel?.id}" class="many-to-one"/>
</div>

<%--
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
--%>

