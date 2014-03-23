<g:applyLayout name="masterpage">
<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>
<% def springSecurityService %>
<html>
	<head>
		<title><g:layoutTitle/></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<style>
		.nav ul li ul 
		{
			display: none;
			background-color: #EFEFEF;
			border-radius:10px;
		}
		
		.nav ul li ul li 
		{
			padding: 0.2em;
			text-align: left;
		}

		.nav ul li:hover ul, .nav ul li:focus ul
		{
			position:absolute;
    		display:block;
    		z-index:1000
		}
		
		.nav ul li ul li 
		{
			float: none;
		}
		</style>
		<g:layoutHead/>
	</head>
	<body>
		<div class="nav">
			<ul>
				<!--  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>-->
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.menu.home.label"/></a></li>
				
				<sec:ifLoggedIn>
    			<sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN, ROLE_USER, ROLE_SALE">
				<li><a class="choose_wheel" href="${createLink(uri: '/maxWheel/inputWheel')}"><g:message code="default.menu.chooseWheel.label"/></a></li>
				<li><a class="appointment" href="${createLink(uri: '/appointment/appointmentGrid')}"><g:message code="default.menu.appointment.label"/></a></li>
				<li><a class="appointmentStuck" href="${createLink(uri: '/appointment/appointmentStuck')}"><g:message code="default.menu.appointmentStuck.label"/></a></li>
				</sec:ifAnyGranted>
				</sec:ifLoggedIn>
				
				<sec:ifLoggedIn>
    			<sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN, ROLE_USER, ROLE_TECH">
				<li><a class="install" href="${createLink(uri: '/')}"><g:message code="default.menu.install.label"/></a></li>
				<li>
					<a class="inventory" href="${createLink(uri: '/preProductTransferLine?isViewNew=true')}"><g:message code="default.menu.inventory.label"/></a>
					<ul>
						<li><a class="list" href="${createLink(uri: '/preProductTransferLine?isViewNew=true')}"><g:message code="default.menu.inventort.transferto"/></a></li>
						<li><a class="list" href="${createLink(uri: '/preProductTransferLine/transferfrom?isViewNew=true')}"><g:message code="default.menu.inventort.transferFrom"/></a></li>
						<li><a class="list" href="${createLink(uri: '/preProductPurchaseLine/orderGrid')}"><g:message code="default.menu.inventory.purchase"/></a></li>
						<li><a class="list" href="${createLink(uri: '/preProductPurchaseLine/')}"><g:message code="default.menu.invenotry.receivepo"/></a></li>
					</ul>
				</li>
				</sec:ifAnyGranted>
				</sec:ifLoggedIn>
				
				<sec:ifLoggedIn>
    			<sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN">
				<li><a class="setting" href="${createLink(uri: '/configMenu')}"><g:message code="default.menu.setting.label" /></a></li>
				</sec:ifAnyGranted>
				</sec:ifLoggedIn>
			</ul>
		</div>
		<g:layoutBody/>
	</body>
</html>
</g:applyLayout>