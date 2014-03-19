
<%@ page import="th.ac.chula.bsd.wheel.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="submenu" />
	</content>
	<content tag="content">
		<div id="show-branch" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list branch">
			
				<g:if test="${branchInstance?.branchName}">
				<li class="fieldcontain">
					<span id="branchName-label" class="property-label"><g:message code="branch.branchName.label" default="Branch Name" /></span>
					
						<span class="property-value" aria-labelledby="branchName-label"><g:fieldValue bean="${branchInstance}" field="branchName"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchAddress}">
				<li class="fieldcontain">
					<span id="branchAddress-label" class="property-label"><g:message code="branch.branchAddress.label" default="Branch Address" /></span>
					
						<span class="property-value" aria-labelledby="branchAddress-label"><g:fieldValue bean="${branchInstance}" field="branchAddress"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchParkingAmount}">
				<li class="fieldcontain">
					<span id="branchParkingAmount-label" class="property-label"><g:message code="branch.branchParkingAmount.label" default="Parking Amount" /></span>
					
						<span class="property-value" aria-labelledby="branchParkingAmount-label"><g:fieldValue bean="${branchInstance}" field="branchParkingAmount"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchMachineAmount}">
				<li class="fieldcontain">
					<span id="branchMachineAmount-label" class="property-label"><g:message code="branch.branchMachineAmount.label" default="Machine Amount" /></span>
					
						<span class="property-value" aria-labelledby="branchMachineAmount-label"><g:fieldValue bean="${branchInstance}" field="branchMachineAmount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.branchStartBreakHour}">
				<li class="fieldcontain">
					<span id="branchMachineAmount-label" class="property-label"><g:message code="branch.branchStartBreak.label" default="Start Break" /></span>
					
						<span class="property-value" aria-labelledby="branchMachineAmount-label">
						<g:fieldValue bean="${branchInstance}" field="branchStartBreakHour"/>:
						<g:if test="${branchInstance.branchStartBreakMinute == 0}">
							00
						</g:if>
						<g:else>
							<g:fieldValue bean="${branchInstance}" field="branchStartBreakMinute"/>
						</g:else>
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchEndBreakHour}">
				<li class="fieldcontain">
					<span id="branchEndBreakHour-label" class="property-label"><g:message code="branch.branchEndBreak.label" default="End Break" /></span>
					
						<span class="property-value" aria-labelledby="branchEndBreakHour-label">
						<g:fieldValue bean="${branchInstance}" field="branchEndBreakHour"/>:
						<g:if test="${branchInstance.branchEndBreakMinute == 0}">
							00
						</g:if>
						<g:else>
							<g:fieldValue bean="${branchInstance}" field="branchEndBreakMinute"/>
						</g:else>
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchMaxLate}">
				<li class="fieldcontain">
					<span id="branchMaxLate-label" class="property-label"><g:message code="branch.branchMaxLate.label" default="Max Late" /></span>
					
						<span class="property-value" aria-labelledby="branchMaxLate-label">
						<g:fieldValue bean="${branchInstance}" field="branchMaxLate"/>
						<g:message code="default.minute" default="Minute(s)" />
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchMaxParking}">
				<li class="fieldcontain">
					<span id="branchMaxParking-label" class="property-label"><g:message code="branch.branchMaxParking.label" default="Max Late" /></span>
					
						<span class="property-value" aria-labelledby="branchMaxParking-label">
						<g:fieldValue bean="${branchInstance}" field="branchMaxParking"/>
						<g:message code="default.minute" default="Minute(s)" />
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchMaxPrepare}">
				<li class="fieldcontain">
					<span id="branchMaxPrepare-label" class="property-label"><g:message code="branch.branchMaxPrepare.label" default="Max Prepare" /></span>
					
						<span class="property-value" aria-labelledby="branchMaxPrepare-label">
						<g:fieldValue bean="${branchInstance}" field="branchMaxPrepare"/>
						<g:message code="default.minute" default="Minute(s)" />
						</span>
					
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchMaxInstallation}">
				<li class="fieldcontain">
					<span id="branchMaxInstallation-label" class="property-label"><g:message code="branch.branchMaxInstallation.label" default="Max Installation" /></span>
					
						<span class="property-value" aria-labelledby="branchMaxInstallation-label">
						<g:fieldValue bean="${branchInstance}" field="branchMaxInstallation"/>
						<g:message code="default.minute" default="Minute(s)" />
						</span>
				</li>
				</g:if>
				
				<g:if test="${branchInstance?.branchMaxLate}">
				<li class="fieldcontain">
					<span id="installPrice-label" class="property-label"><g:message code="branch.installPrice.label" default="Install Price" /></span>
					
						<span class="property-value" aria-labelledby="installPrice-label">
						${params.installPrice}
						<g:message code="default.THB" default="Bath" />
						</span>
					
				</li>
				</g:if>
				
			</ol>
			<g:form url="[resource:branchInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${branchInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<!--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />-->
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
