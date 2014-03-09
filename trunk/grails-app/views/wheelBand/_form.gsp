<%@ page import="th.ac.chula.bsd.wheel.WheelBand" %>



<div class="fieldcontain ${hasErrors(bean: wheelBandInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="wheelBand.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${wheelBandInstance?.name}"/>
</div>

