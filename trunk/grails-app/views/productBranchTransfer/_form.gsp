<%@ page import="th.ac.chula.bsd.wheel.ProductBranchTransfer" %>

<div class="fieldcontain ${hasErrors(bean: productBranchTransferInstance, field: 'branchTo', 'error')} required">
	<label for="branchTo">
		<g:message code="productBranchTransfer.branchTo.label" default="Branch To" />
	</label>
	<%--<g:field name="branchTo.id" type="text" value="${params.branchName}" disabled="true" /> --%>
	<g:select id="branchTo" name="branchTo.id" from="${[params.branch]}" optionKey="id" required="" value="${params.branch.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productBranchTransferInstance, field: 'branchFrom', 'error')} required">
	<label for="branchFrom">
		<g:message code="productBranchTransfer.branchFrom.label" default="Branch From" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branchFrom" name="branchFrom.id" from="${params.branchList}" optionKey="id" required="" value="${productBranchTransferInstance?.branchFrom?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productBranchTransferInstance, field: 'transferDay', 'error')} required">
	<label for="transferDay">
		<g:message code="productBranchTransfer.transferDay.label" default="Transfer Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="transferDay" type="number" value="${productBranchTransferInstance.transferDay}" required=""/>
	<g:message code="default.day"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productBranchTransferInstance, field: 'transferHour', 'error')} required">
	<label for="transferHour">
		<g:message code="productBranchTransfer.transferHour.label" default="Transfer Hour" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="transferHour" type="number" value="${productBranchTransferInstance.transferHour}" required=""/>
	<g:message code="default.hour" />
</div>

<div class="fieldcontain ${hasErrors(bean: productBranchTransferInstance, field: 'transferMinute', 'error')} required">
	<label for="transferMinute">
		<g:message code="productBranchTransfer.transferMinute.label" default="Transfer Minute" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="transferMinute" type="number" value="${productBranchTransferInstance.transferMinute}" required=""/>
	<g:message code="default.minute" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enable', 'error')} ">
	<label for="enable">
		<g:message code="productBranchTransfer.enable.label" default="Enable" />
		
	</label>
	<g:checkBox name="enable" value="${productBranchTransferInstance?.enable}" />
</div>