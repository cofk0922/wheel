<%@ page import="th.ac.chula.bsd.wheel.MaxWheel" %>



<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'band', 'error')} required">
	<label for="band">
		<g:message code="maxWheel.band.label" default="Band" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="band" name="band.id" from="${th.ac.chula.bsd.wheel.WheelBand.list()}" optionKey="id" optionValue="name" required="" value="${maxWheelInstance?.band?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'modelName', 'error')} required">
	<label for="modelName">
		<g:message code="maxWheel.modelName.label" default="ชื่อรุ่นล้อแม็กซ์" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modelName" required="" value="${maxWheelInstance?.modelName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'series', 'error')} required">
	<label for="series">
		<g:message code="maxWheel.series.label" default="ซีรี่ย์" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="series" required="" value="${maxWheelInstance?.series}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'size', 'error')} required">
	<label for="size">
		<g:message code="maxWheel.size.label" default="ขนาด" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="size" type="number" value="${fieldValue(bean: maxWheelInstance, field: 'size')}" step="any" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'width', 'error')} required">
	<label for="width">
		<g:message code="maxWheel.width.label" default="หน้ากว้าง" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="width" type="number" value="${fieldValue(bean: maxWheelInstance, field: 'width')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="maxWheel.weight.label" default="น้ำหนัก" />
		
	</label>
	<g:field name="weight" type="number" value="${fieldValue(bean: maxWheelInstance, field: 'weight')}" step="any" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'pcdCode', 'error')} ">
	<label for="pcdCode">
		<g:message code="maxWheel.pcdCode.label" default="รหัสการจัดเรียงรูน๊อต PCD" />
		
	</label>
	<g:textField name="pcdCode" value="${maxWheelInstance?.pcdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'offSet', 'error')} required">
	<label for="offSet">
		<g:message code="maxWheel.offSet.label" default="ระยะห่างแกนเพลาถึงขอบรถ" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="offSet" type="number" value="${maxWheelInstance.offSet}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'pStatus', 'error')} required">
	<label for="pStatus">
		<g:message code="maxWheel.pStatus.label" default="สถานะการผลิต" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="pStatus" from="${th.ac.chula.bsd.wheel.ProdStatus?.values()}" keys="${th.ac.chula.bsd.wheel.ProdStatus.values()*.name()}" required="" value="${maxWheelInstance?.pStatus?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'forCarBand', 'error')} required">
	<label for="forCarBand">
		<g:message code="maxWheel.forCarBand.label" default="forCarBand" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="forCarBand" name="forCarBand.id" from="${th.ac.chula.bsd.wheel.CarBand.list()}" optionKey="id" optionValue="bandName" required="" value="${maxWheelInstance?.forCarBand?.id}" class="many-to-one"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productStocks', 'error')} ">
	<label for="productStocks">
		<g:message code="maxWheel.productStocks.label" default="Product Stocks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelInstance?.productStocks?}" var="p">
    <li><g:link controller="productStock" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productStock" action="create" params="['maxWheel.id': maxWheelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productStock.label', default: 'ProductStock')])}</g:link>
</li>
</ul>

</div>



<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'productVendorTransfers', 'error')} ">
	<label for="productVendorTransfers">
		<g:message code="maxWheel.productVendorTransfers.label" default="Product Vendor Transfers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelInstance?.productVendorTransfers?}" var="p">
    <li><g:link controller="productVendorTransfer" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productVendorTransfer" action="create" params="['maxWheel.id': maxWheelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productVendorTransfer.label', default: 'ProductVendorTransfer')])}</g:link>
</li>
</ul>

</div> --%>
<g:hiddenField name="productType" value="WHEEL" />

<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'spoke', 'error')} required">
	<label for="spoke">
		<g:message code="maxWheel.spoke.label" default="ชนิดของก้านล้อแม็กซ์" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="spoke" from="${th.ac.chula.bsd.wheel.SpokeType?.values()}" keys="${th.ac.chula.bsd.wheel.SpokeType.values()*.name()}" required="" value="${maxWheelInstance?.spoke?.name()}"/>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: maxWheelInstance, field: 'wheelLists', 'error')} ">
	<label for="wheelLists">
		<g:message code="maxWheel.wheelLists.label" default="Wheel Lists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maxWheelInstance?.wheelLists?}" var="w">
    <li><g:link controller="carWheelList" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carWheelList" action="create" params="['maxWheel.id': maxWheelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carWheelList.label', default: 'CarWheelList')])}</g:link>
</li>
</ul>

</div> --%>

