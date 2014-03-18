	<div id="searchresults">
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
					</tr>
				</thead>
				<tbody>
				<g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "id")}</g:link></td>
						<td>${fieldValue(bean: appointmentInstance, field: "startDate")}</td>
						<td>${fieldValue(bean: appointmentInstance, field: "endDate")}</td>
						<td>${fieldValue(bean: appointmentInstance, field: "customer.carCode")}</td>
						<td>${fieldValue(bean: appointmentInstance, field: "customer.customerName")}</td>
						<td>${fieldValue(bean: appointmentInstance, field: "status")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appointmentInstanceCount ?: 0}" />
			</div>
			
			<!-- May -->
			<div>
				<a href="${createLink(uri:'/appointment/test') }">Test Appointment</a>
			</div>
		</div>
	</div>