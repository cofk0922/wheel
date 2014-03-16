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
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a class="choose_wheel" href="${createLink(uri: '/')}"><g:message code="default.chooseWheel.label"/></a></li>
				<li>
					<a class="appointment" href="${createLink(uri: '/appointment')}"><g:message code="default.appointment.label"/></a>
					<ul>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.checkin.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.changeappoint.label"/></a></li>
					</ul>
				</li>
				<li><a class="install" href="${createLink(uri: '/')}"><g:message code="default.install.label"/></a></li>
				<li>
					<a class="inventory" href="${createLink(uri: '/')}"><g:message code="default.inventory.label"/></a>
					<ul>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.transferto.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.transferfrom.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.purchase.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.receive.label"/></a></li>
					</ul>
				</li>
				<li>
					<a class="setting" href="${createLink(uri: '/configMenu')}"><g:message code="default.setting.label"/></a>
					<ul>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.branch.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.user.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.wheel.label"/></a></li>
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.car.label"/></a></li>
					</ul>
				</li>
			</ul>
		</div>
		<g:layoutBody/>
	</body>
</html>
</g:applyLayout>