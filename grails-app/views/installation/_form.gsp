<%@ page import="th.ac.chula.bsd.wheel.Installation" %>



<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="installation.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${installationInstance?.createdDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'updatedDate', 'error')} required">
	<label for="updatedDate">
		<g:message code="installation.updatedDate.label" default="Updated Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedDate" precision="day"  value="${installationInstance?.updatedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="installation.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${installationInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="installation.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${installationInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="installation.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${th.ac.chula.bsd.wheel.InstallationStatus?.values()}" keys="${th.ac.chula.bsd.wheel.InstallationStatus.values()*.name()}" required="" value="${installationInstance?.status?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'appointment', 'error')} required">
	<label for="appointment">
		<g:message code="installation.appointment.label" default="Appointment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="appointment" name="appointment.id" from="${th.ac.chula.bsd.wheel.Appointment.list()}" optionKey="id" required="" value="${installationInstance?.appointment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="installation.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${installationInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="installation.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${installationInstance?.createdBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'requisitions', 'error')} ">
	<label for="requisitions">
		<g:message code="installation.requisitions.label" default="Requisitions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${installationInstance?.requisitions?}" var="r">
    <li><g:link controller="requisitionLine" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requisitionLine" action="create" params="['installation.id': installationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requisitionLine.label', default: 'RequisitionLine')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: installationInstance, field: 'updatedBy', 'error')} required">
	<label for="updatedBy">
		<g:message code="installation.updatedBy.label" default="Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="updatedBy" name="updatedBy.id" from="${th.ac.chula.bsd.security.User.list()}" optionKey="id" required="" value="${installationInstance?.updatedBy?.id}" class="many-to-one"/>
</div>

