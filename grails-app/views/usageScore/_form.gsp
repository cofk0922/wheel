<%@ page import="th.ac.chula.bsd.wheel.UsageScore" %>



<div class="fieldcontain ${hasErrors(bean: usageScoreInstance, field: 'spoke', 'error')} required">
	<label for="spoke">
		<g:message code="usageScore.spoke.label" default="Spoke" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="spoke" from="${th.ac.chula.bsd.wheel.SpokeType?.values()}" keys="${th.ac.chula.bsd.wheel.SpokeType.values()*.name()}" required="" value="${usageScoreInstance?.spoke?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usageScoreInstance, field: 'usage', 'error')} required">
	<label for="usage">
		<g:message code="usageScore.usage.label" default="Usage" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="usage" from="${th.ac.chula.bsd.wheel.UsageType?.values()}" keys="${th.ac.chula.bsd.wheel.UsageType.values()*.name()}" required="" value="${usageScoreInstance?.usage?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usageScoreInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="usageScore.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${usageScoreInstance.score}" required=""/>
</div>

