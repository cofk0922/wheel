<%@ page import="th.ac.chula.bsd.wheel.ProductStock" %>



<div class="fieldcontain ${hasErrors(bean: productStockInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="productStock.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${productStockInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productStockInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productStock.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${th.ac.chula.bsd.wheel.Product.list()}" optionKey="id" required="" value="${productStockInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productStockInstance, field: 'stock', 'error')} required">
	<label for="stock">
		<g:message code="productStock.stock.label" default="Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stock" type="number" value="${productStockInstance.stock}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productStockInstance, field: 'unitPrice', 'error')} required">
	<label for="unitPrice">
		<g:message code="productStock.unitPrice.label" default="Unit Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="unitPrice" value="${fieldValue(bean: productStockInstance, field: 'unitPrice')}" required=""/>
</div>

