<%@ page import="th.ac.chula.bsd.wheel.WorkDay" %>



<div class="fieldcontain ${hasErrors(bean: workDayInstance, field: 'workDayName', 'error')} required">
	<label for="workDayName">
		<g:message code="workDay.workDayName.label" default="Work Day Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="workDayName" required="" value="${workDayInstance?.workDayName}" disabled="true"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workDayInstance, field: 'startHour', 'error')} required">
	<label for="startHour">
		<g:message code="workDay.startHour.label" default="Start Hour" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="startHour" type="number" value="${workDayInstance.startHour}" required=""/>
	:
	<g:field name="startMinute" type="number" value="${workDayInstance.startMinute}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: workDayInstance, field: 'endHour', 'error')} required">
	<label for="endHour">
		<g:message code="workDay.endHour.label" default="End Hour" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="endHour" type="number" value="${workDayInstance.endHour}" required=""/>
	:
	<g:field name="endMinute" type="number" value="${workDayInstance.endMinute}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: workDayInstance, field: 'workActive', 'error')} ">
	<label for="workActive">
		<g:message code="workDay.workActive.label" default="Work Active" />
		
	</label>
	<g:checkBox name="workActive" value="${workDayInstance?.workActive}" />
</div>

<%--
<div class="fieldcontain ${hasErrors(bean: workDayInstance, field: 'workDayCode', 'error')} required">
	<label for="workDayCode">
		<g:message code="workDay.workDayCode.label" default="Work Day Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="workDayCode" from="${workDayInstance.constraints.workDayCode.inList}" required="" value="${fieldValue(bean: workDayInstance, field: 'workDayCode')}" valueMessagePrefix="workDay.workDayCode"/>
</div>
 --%>
<div class="fieldcontain ${hasErrors(bean: workDayInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="workDay.branch.label" default="Branch" />
	</label>
	<%--<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${workDayInstance?.branch?.id}" class="many-to-one"/> --%>
	<g:fieldValue bean="${workDayInstance}" field="branch.branchName"/>
</div>

