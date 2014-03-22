
<%@ page import="th.ac.chula.bsd.wheel.Appointment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appointmentStuck.label', default: 'Appointment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
		<script type="text/javascript">
   function showSpinner() {
      $('spinner').show();
   }
   function hideSpinner() {
      $('spinner').hide();
   }
   Ajax.Responders.register({
      onLoading: function() {
         showSpinner();
      },
      onComplete: function() {     
         if(!Ajax.activeRequestCount) hideSpinner();
      }
   });
</script>
	</head>
	<body>
		<a href="#list-appointment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<!-- <div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		 -->
		<div id="list-appointment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'appointment.id.label', default: 'No.')}" />
						<g:sortableColumn property="startDate" title="${message(code: 'appointment.startDate.label', default: 'Start Date')}" />
						<g:sortableColumn property="endDate" title="${message(code: 'appointment.endDate.label', default: 'End Date')}" />
						<g:sortableColumn property="carCode" title="${message(code: 'appointment.customer.carCode.label', default: 'Car Code')}" />
						<g:sortableColumn property="customerName" title="${message(code: 'appointment.customer.custName.label', default: 'Customer Name')}" />
						<g:sortableColumn property="status" title="${message(code: 'appointment.status.label', default: 'Status')}" />
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
					<g:form url="[resource:appointmentInstance, action:'idelAppointment']" method="PUT">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "id")}</g:link></td>
						<td><g:formatDate formatName="default.date.shortformat" date="${appointmentInstance.startDate}" /></td>
						<td><g:formatDate formatName="default.date.shortformat" date="${appointmentInstance.endDate}" /></td>
						<td>${fieldValue(bean: appointmentInstance, field: "customer.carCode")}</td>
						<td>${fieldValue(bean: appointmentInstance, field: "customer.customerName")}</td>
						<td>${fieldValue(bean: appointmentInstance, field: "status")}</td>
						<td><g:submitButton name="idelAppointment" value="${message(code:'appointmentIdel.label') }" /></td>
					</tr>
					</g:form>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appointmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
