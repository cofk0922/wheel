<%@ page import="th.ac.chula.bsd.wheel.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchName', 'error')} ">
	<label for="branchName">
		<g:message code="branch.branchName.label" default="Branch Name" />
		
	</label>
	<g:textField name="branchName" value="${branchInstance?.branchName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchAddress', 'error')} ">
	<label for="branchAddress">
		<g:message code="branch.branchAddress.label" default="Branch Address" />
		
	</label>
	<g:textField name="branchAddress" value="${branchInstance?.branchAddress}"/>
</div>
<br />
<hr />
<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchParkingAmount', 'error')} ">
	<label for="branchParkingAmount">
		<g:message code="branch.branchParkingAmount.label" default="Parking Amount" />
		
	</label>
	<g:field name="branchParkingAmount" type="number" value="${branchInstance?.branchParkingAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchMachineAmount', 'error')} ">
	<label for="branchMachineAmount">
		<g:message code="branch.branchMachineAmount.label" default="Machine Amount" />
		
	</label>
	<g:field name="branchMachineAmount" type="number" value="${branchInstance?.branchMachineAmount}" required=""/>
</div>
<br />
<hr />
<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchStartBreakHour', 'error')} ">
	<label for="branchStartBreakHour">
		<g:message code="branch.branchStartBreakHour.label" default="Start Break Hour" />
		
	</label>
	<g:field name="branchStartBreakHour" type="number" value="${branchInstance?.branchStartBreakHour}" required=""/>
	:
	<g:field name="branchStartBreakMinute" type="number" value="${branchInstance?.branchStartBreakMinute}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchEndBreakHour', 'error')} ">
	<label for="branchEndBreakHour">
		<g:message code="branch.branchEndBreakHour.label" default="End Break Hour" />
		
	</label>
	<g:field name="branchEndBreakHour" type="number" value="${branchInstance?.branchEndBreakHour}" required=""/>
	:
	<g:field name="branchEndBreakMinute" type="number" value="${branchInstance?.branchEndBreakMinute}" required=""/>
</div>
<br />
<hr />
<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchMaxLate', 'error')} ">
	<label for="branchMaxLate">
		<g:message code="branch.branchMaxLate.label" default="Max Late" />
		
	</label>
	<g:field name="branchMaxLate" type="number" value="${branchInstance?.branchMaxLate}" required=""/>
	<g:message code="default.minute" default="Minute(s)" />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchMaxParking', 'error')} ">
	<label for="branchMaxParking">
		<g:message code="branch.branchMaxParking.label" default="Max Parking" />
		
	</label>
	<g:field name="branchMaxParking" type="number" value="${branchInstance?.branchMaxParking}" required=""/>
	<g:message code="default.minute" default="Minute(s)" />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchMaxPrepare', 'error')} ">
	<label for="branchMaxPrepare">
		<g:message code="branch.branchMaxPrepare.label" default="Max Prepare" />
		
	</label>
	<g:field name="branchMaxPrepare" type="number" value="${branchInstance?.branchMaxPrepare}" required=""/>
	<g:message code="default.minute" default="Minute(s)" />
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchMaxInstallation', 'error')} ">
	<label for="branchMaxInstallation">
		<g:message code="branch.branchMaxInstallation.label" default="Max Installation (Minute)" />
		
	</label>
	<g:field name="branchMaxInstallation" type="number" value="${branchInstance?.branchMaxInstallation}" required=""/>
	<g:message code="default.minute" default="Minute(s)" />
</div>
<br />
<hr />
<div class="fieldcontain installPrice">
	<label for="installPrice">
		<g:message code="branch.installPrice.label" default="Installation Price" />
		
	</label>
	<g:field name="installPrice" type="number" value="${params.installPrice}" required="" step="any" />
	<g:message code="default.THB" default="Bath" />
</div>