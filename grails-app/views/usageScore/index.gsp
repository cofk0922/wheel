
<%@ page import="th.ac.chula.bsd.wheel.UsageScore" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'usageScore.label', default: 'UsageScore')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-usageScore" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="sType" title="${message(code: 'usageScore.sType.label', default: 'ST ype')}" />
					
						<g:sortableColumn property="uType" title="${message(code: 'usageScore.uType.label', default: 'UT ype')}" />
					
						<g:sortableColumn property="score" title="${message(code: 'usageScore.score.label', default: 'Score')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usageScoreInstanceList}" status="i" var="usageScoreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usageScoreInstance.id}">${fieldValue(bean: usageScoreInstance, field: "sType")}</g:link></td>
					
						<td>${fieldValue(bean: usageScoreInstance, field: "uType")}</td>
					
						<td>${fieldValue(bean: usageScoreInstance, field: "score")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usageScoreInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
