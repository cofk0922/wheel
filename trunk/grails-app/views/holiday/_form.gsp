<%@ page import="th.ac.chula.bsd.wheel.Holiday" %>



<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'holidayDate', 'error')} required">
	<label for="holidayDate">
		<g:message code="holiday.holidayDate.label" default="Holiday Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="holidayDate" precision="day"  value="${holidayInstance?.holidayDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: holidayInstance, field: 'holidayName', 'error')} ">
	<label for="holidayName">
		<g:message code="holiday.holidayName.label" default="Holiday Name" />
		
	</label>
	<g:textField name="holidayName" value="${holidayInstance?.holidayName}"/>
</div>

