
<%@ page import="th.ac.chula.bsd.wheel.ProductVendorTransfer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="submenu" />
	</content>
	<content tag="content">
		<div id="show-productVendorTransfer" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" />
				: ${params.product.prodName }
			</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productVendorTransfer">
			
				<g:if test="${productVendorTransferInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="productVendorTransfer.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${productVendorTransferInstance?.branch?.id}">${productVendorTransferInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			<%--
				<g:if test="${productVendorTransferInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productVendorTransfer.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productVendorTransferInstance?.product?.id}">${productVendorTransferInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			 --%>
			 
				<g:if test="${productVendorTransferInstance?.unitPrice}">
				<li class="fieldcontain">
					<span id="unitPrice-label" class="property-label"><g:message code="productVendorTransfer.unitPrice.label" default="Unit Price" /></span>
					
						<span class="property-value" aria-labelledby="unitPrice-label">
							<g:fieldValue bean="${productVendorTransferInstance}" field="unitPrice"/>
							<g:message code="default.THB" />
						</span>
					
				</li>
				</g:if>
						
				<g:if test="${productVendorTransferInstance?.vendor}">
				<li class="fieldcontain">
					<span id="vendor-label" class="property-label"><g:message code="productVendorTransfer.vendor.label" default="Vendor" /></span>
					
						<span class="property-value" aria-labelledby="vendor-label"><g:link controller="vendor" action="show" id="${productVendorTransferInstance?.vendor?.id}">${productVendorTransferInstance?.vendor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${productVendorTransferInstance?.transferDay}">
				<li class="fieldcontain">
					<span id="transferDay-label" class="property-label"><g:message code="productVendorTransfer.transferDay.label" default="Transfer Day" /></span>
					
						<span class="property-value" aria-labelledby="transferDay-label">
							<g:fieldValue bean="${productVendorTransferInstance}" field="transferDay"/>
							<g:message code="default.day" />
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${productVendorTransferInstance?.transferHour}">
				<li class="fieldcontain">
					<span id="transferHour-label" class="property-label"><g:message code="productVendorTransfer.transferHour.label" default="Transfer Hour" /></span>
					
						<span class="property-value" aria-labelledby="transferHour-label">
							<g:fieldValue bean="${productVendorTransferInstance}" field="transferHour"/>
							<g:message code="default.hour"/>
						</span>
					
				</li>
				</g:if>
			
				<g:if test="${productVendorTransferInstance?.transferMinute}">
				<li class="fieldcontain">
					<span id="transferMinute-label" class="property-label"><g:message code="productVendorTransfer.transferMinute.label" default="Transfer Minute" /></span>
					
						<span class="property-value" aria-labelledby="transferMinute-label">
							<g:fieldValue bean="${productVendorTransferInstance}" field="transferMinute"/>
							<g:message code="default.minute" />
						</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productVendorTransferInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productVendorTransferInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</content>
	</body>
</html>
