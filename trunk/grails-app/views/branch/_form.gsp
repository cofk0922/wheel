<%@ page import="th.ac.chula.bsd.wheel.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchName', 'error')} ">
	<label for="branchName">
		<g:message code="branch.branchName.label" default="Branch Name" />
		
	</label>
	<g:textField name="branchName" value="${branchInstance?.branchName}"/>
</div>

