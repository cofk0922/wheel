<%@ page import="th.ac.chula.bsd.wheel.CarBand" %>



<div class="fieldcontain ${hasErrors(bean: carBandInstance, field: 'bandName', 'error')} ">
	<label for="bandName">
		<g:message code="carBand.bandName.label" default="ยี่ห้อรถ" />
		
	</label>
	<g:textField name="bandName" value="${carBandInstance?.bandName}"/>
</div>

<%-- <div class="fieldcontain ${hasErrors(bean: carBandInstance, field: 'dWheel', 'error')} ">
	<label for="dWheel">
		<g:message code="carBand.dWheel.label" default="DW heel" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carBandInstance?.dWheel?}" var="d">
    <li><g:link controller="defaultWheel" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="defaultWheel" action="create" params="['carBand.id': carBandInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'defaultWheel.label', default: 'DefaultWheel')])}</g:link>
</li>
</ul>

</div>--%>

<%-- <div class="fieldcontain ${hasErrors(bean: carBandInstance, field: 'models', 'error')} ">
	<label for="models">
		<g:message code="carBand.models.label" default="Models" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carBandInstance?.models?}" var="m">
    <li><g:link controller="carModel" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="carModel" action="create" params="['carBand.id': carBandInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'carModel.label', default: 'CarModel')])}</g:link>
</li>
</ul>

</div>--%>

