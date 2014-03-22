<%@ page import="th.ac.chula.bsd.inventory.ReceivePurchaseLine" %>



<div class="fieldcontain ${hasErrors(bean: receivePurchaseLineInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="receivePurchaseLine.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${receivePurchaseLineInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: receivePurchaseLineInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="receivePurchaseLine.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" required="" value="${receivePurchaseLineInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: receivePurchaseLineInstance, field: 'receivePurchase', 'error')} required">
	<label for="receivePurchase">
		<g:message code="receivePurchaseLine.receivePurchase.label" default="Receive Purchase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receivePurchase" name="receivePurchase.id" from="${th.ac.chula.bsd.inventory.ReceivePurchase.list()}" optionKey="id" required="" value="${receivePurchaseLineInstance?.receivePurchase?.id}" class="many-to-one"/>
</div>

