
<%@ page import="th.ac.chula.bsd.inventory.ProductPurchase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productPurchase.label', default: 'ProductPurchase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productPurchase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productPurchase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productPurchase">
			
				<g:if test="${productPurchaseInstance?.createdDate}">
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="productPurchase.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${productPurchaseInstance?.createdDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.updatedDate}">
				<li class="fieldcontain">
					<span id="updatedDate-label" class="property-label"><g:message code="productPurchase.updatedDate.label" default="Updated Date" /></span>
					
						<span class="property-value" aria-labelledby="updatedDate-label"><g:formatDate date="${productPurchaseInstance?.updatedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.arrivalDate}">
				<li class="fieldcontain">
					<span id="arrivalDate-label" class="property-label"><g:message code="productPurchase.arrivalDate.label" default="Arrival Date" /></span>
					
						<span class="property-value" aria-labelledby="arrivalDate-label"><g:formatDate date="${productPurchaseInstance?.arrivalDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="productPurchase.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${productPurchaseInstance?.branch?.id}">${productPurchaseInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="productPurchase.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${productPurchaseInstance?.createdBy?.id}">${productPurchaseInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.paymentType}">
				<li class="fieldcontain">
					<span id="paymentType-label" class="property-label"><g:message code="productPurchase.paymentType.label" default="Payment Type" /></span>
					
						<span class="property-value" aria-labelledby="paymentType-label"><g:link controller="purchasePaymentType" action="show" id="${productPurchaseInstance?.paymentType?.id}">${productPurchaseInstance?.paymentType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.purchaseDate}">
				<li class="fieldcontain">
					<span id="purchaseDate-label" class="property-label"><g:message code="productPurchase.purchaseDate.label" default="Purchase Date" /></span>
					
						<span class="property-value" aria-labelledby="purchaseDate-label"><g:formatDate date="${productPurchaseInstance?.purchaseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.purchaseID}">
				<li class="fieldcontain">
					<span id="purchaseID-label" class="property-label"><g:message code="productPurchase.purchaseID.label" default="Purchase ID" /></span>
					
						<span class="property-value" aria-labelledby="purchaseID-label"><g:fieldValue bean="${productPurchaseInstance}" field="purchaseID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.purchaseLines}">
				<li class="fieldcontain">
					<span id="purchaseLines-label" class="property-label"><g:message code="productPurchase.purchaseLines.label" default="Purchase Lines" /></span>
					
						<g:each in="${productPurchaseInstance.purchaseLines}" var="p">
						<span class="property-value" aria-labelledby="purchaseLines-label"><g:link controller="productPurchaseLine" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.receivePurchases}">
				<li class="fieldcontain">
					<span id="receivePurchases-label" class="property-label"><g:message code="productPurchase.receivePurchases.label" default="Receive Purchases" /></span>
					
						<g:each in="${productPurchaseInstance.receivePurchases}" var="r">
						<span class="property-value" aria-labelledby="receivePurchases-label"><g:link controller="receivePurchase" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="productPurchase.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${productPurchaseInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.totalPrice}">
				<li class="fieldcontain">
					<span id="totalPrice-label" class="property-label"><g:message code="productPurchase.totalPrice.label" default="Total Price" /></span>
					
						<span class="property-value" aria-labelledby="totalPrice-label"><g:fieldValue bean="${productPurchaseInstance}" field="totalPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="productPurchase.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:link controller="user" action="show" id="${productPurchaseInstance?.updatedBy?.id}">${productPurchaseInstance?.updatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.vat}">
				<li class="fieldcontain">
					<span id="vat-label" class="property-label"><g:message code="productPurchase.vat.label" default="Vat" /></span>
					
						<span class="property-value" aria-labelledby="vat-label"><g:fieldValue bean="${productPurchaseInstance}" field="vat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPurchaseInstance?.vendor}">
				<li class="fieldcontain">
					<span id="vendor-label" class="property-label"><g:message code="productPurchase.vendor.label" default="Vendor" /></span>
					
						<span class="property-value" aria-labelledby="vendor-label"><g:link controller="vendor" action="show" id="${productPurchaseInstance?.vendor?.id}">${productPurchaseInstance?.vendor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productPurchaseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productPurchaseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
