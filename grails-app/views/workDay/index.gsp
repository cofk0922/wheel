
<%@ page import="th.ac.chula.bsd.wheel.WorkDay" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'workDay.label', default: 'WorkDay')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<content tag="navleft">
			<g:render template="/branch/submenu" />
		</content>
		<content tag="content">
		<div id="list-workDay" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<sec:ifLoggedIn>
    			<sec:ifAllGranted roles="ROLE_SUPERADMIN">
    			<g:form action="index">
    				<g:select id="branch" name="branch.id" from="${th.ac.chula.bsd.wheel.Branch.list()}" optionKey="id" required="" value="${params.branchID}" class="many-to-one" onchange="submit()"/>
    			</g:form>
				</sec:ifAllGranted>
			</sec:ifLoggedIn>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="workDayName" title="${message(code: 'workDay.workDayName.label', default: 'Work Day Name')}" />
					
						<g:sortableColumn property="startHour" title="${message(code: 'workDay.startHour.label', default: 'Start Hour')}" />
										
						<g:sortableColumn property="endHour" title="${message(code: 'workDay.endHour.label', default: 'End Hour')}" />
										
						<g:sortableColumn property="workActive" title="${message(code: 'workDay.workActive.label', default: 'Work Active')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workDayInstanceList}" status="i" var="workDayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workDayInstance.id}">${fieldValue(bean: workDayInstance, field: "workDayName")}</g:link></td>
					
						<td>
							${fieldValue(bean: workDayInstance, field: "startHour")}
							:
							<g:if test="${workDayInstance.startMinute == 0}">
								00
							</g:if>
							<g:else>
								${fieldValue(bean: workDayInstance, field: "startMinute")}
							</g:else>
						
						</td>
										
						<td>
							${fieldValue(bean: workDayInstance, field: "endHour")}
							:
							<g:if test="${workDayInstance.endMinute == 0}">
								00
							</g:if>
							<g:else>
								${fieldValue(bean: workDayInstance, field: "endMinute")}
							</g:else>
						</td>
										
						<td><g:formatBoolean boolean="${workDayInstance.workActive}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workDayInstanceCount ?: 0}" />
			</div>
		</div>
		</content>
	</body>
</html>
