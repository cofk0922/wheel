<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}
			
			.ie6 #status {
				display: inline;
				/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}
			
			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
			
			#status li {
				line-height: 1.3;
			}
			
			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}
			
			#page-body {
				margin: 2em 1em 1.25em 18em;
			}
			
			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}
			
			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}
			
			#controller-list ul {
				list-style-position: inside;
			}
			
			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}
			
			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}
				#page-body {
					margin: 0 1em 1em;
				}
				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>		
		<table>
			<sec:ifLoggedIn>
    			<sec:ifAllGranted roles="ROLE_USER">
        			 <tr>
						<td>- <g:link controller="appointment"><g:message code="default.menu.appointment.label"/>เลือกล้อแม็กซ์และนัดหมายติดตั้งล้อแม็กซ์</g:link></td>
					</tr>
     			</sec:ifAllGranted>
			</sec:ifLoggedIn>
 			<tr>
				<td>- <g:link controller="maxWheel" action="inputWheel"><g:message code="default.menu.chooseWheel.label"/></g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="appointment" action="appointmentGrid"><g:message code="default.menu.appointment.label"/></g:link></td>
			</tr>
			
			<tr>
				<td>- <g:link controller="appointment" action="appointmentStuck"><g:message code="default.menu.appointmentStuck.label"/></g:link></td>
			</tr>

			<tr>
				<td>- <g:link controller="installation"><g:message code="default.menu.install.label"/></g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="preProductTransferLine" action="index" params="[isViewNew:true]"><g:message code="default.menu.inventory.label"/></g:link></td>
			</tr>
			<tr>
				<td>- <a class="setting" href="${createLink(uri: '/configMenu')}"><g:message code="default.menu.setting.label" /></a></td>
			</tr>
	 <!-- 
			<tr>
				<td>- <g:link controller="appointment">ระบบนัดหมายติดตั้งล้อแม็กซ์</g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="appointment" action="appointmentCalendar">ระบบเพิ่มการนัดหมายติดตั้งล้อแม็กซ์</g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="appointment" action="manageCalendar">ระบบจัดการตารางนัดหมายติดตั้งล้อแม็กซ์</g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="orderAndTransfer">ระบบสั่งซื้อและโอนล้อแม็กซ์และอะไหล่</g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="productStock">ระบบคลังสินค้า</g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="login">ระบบสำหรับผู้ดูแลระบบ</g:link></td>
			</tr>
			<tr>
				<td>- <g:link controller="maxWheel" action="inputWheel">ระบบนำเข้าล้อแม็กซ์และอะไหล่</g:link></td>
			</tr>  
			<tr>
				<td>- <g:link controller="configMenu">การตั้งค่าระบบ</g:link></td>
			</tr>
			 -->
		</table>	
	</body>
</html>
