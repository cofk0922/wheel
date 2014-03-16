<%@ page import="th.ac.chula.bsd.wheel.CarColor" %>


<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carModel', 'error')} required">
	<label for="carModel">
		<g:message code="car.carModel.label" default="Band" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carModel" name="carModel.id" from="${th.ac.chula.bsd.wheel.CarModel.list()}" optionKey="id" optionValue="modelName" required="" value="${carInstance?.band?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carImage', 'error')} ">
	<label for="carImage">
		<g:message code="car.carImage.label" default="Car Image" />
		
	</label>
	<g:textField name="carImage" value="${carInstance?.carImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'backHeight', 'error')} required">
	<label for="backHeight">
		<g:message code="car.backHeight.label" default="Back Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backHeight" type="number" value="${carInstance?.backHeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'backWidth', 'error')} required">
	<label for="backWidth">
		<g:message code="car.backWidth.label" default="Back Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backWidth" type="number" value="${carInstance?.backWidth}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'backX1', 'error')} required">
	<label for="backX1">
		<g:message code="car.backX1.label" default="Back X1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backX1" type="number" value="${carInstance?.backX1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'backX2', 'error')} required">
	<label for="backX2">
		<g:message code="car.backX2.label" default="Back X2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backX2" type="number" value="${carInstance?.backX2}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'backY', 'error')} required">
	<label for="backY">
		<g:message code="car.backY.label" default="Back Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backY" type="number" value="${carInstance?.backY}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'backY1', 'error')} required">
	<label for="backY1">
		<g:message code="car.backY1.label" default="Back Y1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="backY1" type="number" value="${carInstance?.backY1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'frontHeight', 'error')} required">
	<label for="frontHeight">
		<g:message code="car.frontHeight.label" default="Front Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontHeight" type="number" value="${carInstance?.frontHeight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'frontWidth', 'error')} required">
	<label for="frontWidth">
		<g:message code="car.frontWidth.label" default="Front Width" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontWidth" type="number" value="${carInstance?.frontWidth}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'frontX1', 'error')} required">
	<label for="frontX1">
		<g:message code="car.frontX1.label" default="Front X1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontX1" type="number" value="${carInstance?.frontX1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'frontX2', 'error')} required">
	<label for="frontX2">
		<g:message code="car.frontX2.label" default="Front X2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontX2" type="number" value="${carInstance?.frontX2}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'frontY1', 'error')} required">
	<label for="frontY1">
		<g:message code="car.frontY1.label" default="Front Y1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontY1" type="number" value="${carInstance?.frontY1}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'frontY2', 'error')} required">
	<label for="frontY2">
		<g:message code="car.frontY2.label" default="Front Y2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frontY2" type="number" value="${carInstance?.frontY2}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'hVal', 'error')} ">
	<label for="hVal">
		<g:message code="car.hVal.label" default="H Value" />
		
	</label>
	<g:textField name="hVal" value="${carInstance?.hVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'sVal', 'error')} ">
	<label for="sVal">
		<g:message code="car.sVal.label" default="S Value" />
		
	</label>
	<g:textField name="sVal" value="${carInstance?.sVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'vVal', 'error')} ">
	<label for="vVal">
		<g:message code="car.vVal.label" default="V Value" />
		
	</label>
	<g:textField name="vVal" value="${carInstance?.vVal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'hexVal', 'error')} ">
	<label for="hexVal">
		<g:message code="car.hexVal.label" default="Hex Value" />
		
	</label>
	<g:textField name="hexVal" value="${carInstance?.hexVal}"/>
</div>


