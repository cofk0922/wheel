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
				<li><a class="home" href="${createLink(uri: '/')}">หน้าหลัก</a></li>
				<li><a class="choose_wheel" href="${createLink(uri: '/')}">เลือกล้อแม็กซ์</a></li>
				<li><a class="appointment" href="${createLink(uri: '/appointment')}">จัดการนัดหมาย</a></li>
				<li><a class="install" href="${createLink(uri: '/')}">ติดตั้งล้อแม็กซ์</a></li>
				<li>
					<a class="inventory" href="${createLink(uri: '/')}">จัดการคลังสินค้า</a>
					<ul>
						<li><a class="list" href="${createLink(uri: '/')}"><g:message code="ขอโอนสินค้า"/></a></li>
						<li><a class="list" href="${createLink(uri: '/')}"><g:message code="โอนสินค้า"/></a></li>
						<li><a class="list" href="${createLink(uri: '/')}"><g:message code="สั่งซื้อสินค้า"/></a></li>
						<li><a class="list" href="${createLink(uri: '/')}"><g:message code="รับเข้าสินค้า"/></a></li>
					</ul>
				</li>
				<li><a class="setting" href="${createLink(uri: '/configMenu')}">ตั้งค่าระบบ</a></li>
			</ul>
		</div>
		<g:layoutBody/>
	</body>
</html>
</g:applyLayout>