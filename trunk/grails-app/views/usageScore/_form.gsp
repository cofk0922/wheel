<%@ page import="th.ac.chula.bsd.wheel.UsageScore" %>



<div class="fieldcontain ${hasErrors(bean: usageScoreInstance, field: 'sType', 'error')} required">
	<label for="sType">
		<g:message code="usageScore.sType.label" default="ST ype" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sType" from="${th.ac.chula.bsd.wheel.SpokeType?.values()}" keys="${th.ac.chula.bsd.wheel.SpokeType.values()*.name()}" required="" value="${usageScoreInstance?.sType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usageScoreInstance, field: 'uType', 'error')} required">
	<label for="uType">
		<g:message code="usageScore.uType.label" default="UT ype" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="uType" from="${th.ac.chula.bsd.wheel.UsageType?.values()}" keys="${th.ac.chula.bsd.wheel.UsageType.values()*.name()}" required="" value="${usageScoreInstance?.uType?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usageScoreInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="usageScore.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${usageScoreInstance.score}" required=""/>
</div>

