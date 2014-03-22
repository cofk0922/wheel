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

.configMenu div.menuSection  {
	padding-left:1em;
	margin: 10px;
}

.configMenu .menuSection ul {
	padding-left:2em;
	list-style-type:circle;
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
	<div class="configMenu">
		<div class="menuSection">
		<sec:ifLoggedIn>
		<g:set var="userObject" value="${th.ac.chula.bsd.security.User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
			<h1><g:message code="default.submenu.branchuser" default="สาขา และ ผู้ใช้งาน"/></h1>
			<ul>
				<li><g:link controller="branch"><g:message code="default.submenu.branchuser.branch" default="สาขา"/></g:link></li>
				<li><g:link controller="productBranchTransfer"><g:message code="default.submenu.branchuser.branchtransfer" /></g:link></li>
				<li><g:link controller="user"><g:message code="default.submenu.branchuser.user" default="ผู้ใช้"/></g:link></li>
				<li><g:link controller="role"><g:message code="default.submenu.branchuser.role" default="สิทธิการใช้งาน"/></g:link></li>
				<li><g:link controller="userRole"><g:message code="default.submenu.branchuser.userrole" default="ผูกสิทธิการใช้งาน"/></g:link></li>
				<li><g:link controller="user"action="show"id='${userObject.id}'><g:message code="default.submenu.branchuser.edituser" default="แก้ไขข้อมูลส่วนตัว"/></g:link></li>
			</ul>
		</div>
		<hr />
		<div class="menuSection">
			<h1><g:message code="default.submenu.vendor" default="ผู้ผลิต และ จัดจำหน่าย ล้อแม็กซ์และอะไหล่"/></h1>
			<ul>
				<li><g:link controller="vendor"><g:message code="default.submenu.vendor.vendor" default="รายชื่อผู้ผลิต และ จัดจำหน่าย"/></g:link></li>
			</ul>
		</div>
		<hr />
		<div class="menuSection">
			<h1><g:message code="default.submenu.product" default="ล้อแม็กซ์ และ อะไหล่"/></h1>
			<ul>
				<li><g:link controller="wheelBand"><g:message code="default.submenu.product.maxwheelbrand" default="ยี่ห้อล้อแม็กซ์"/></g:link></li>
				<li><g:link controller="maxWheel"><g:message code="default.submenu.product.maxwheel" default="รุ่นล้อแม็กซ์"/></g:link></li>
				<li><g:link controller="maxWheel" action="inputWheel"><g:message code="default.submenu.product.inputwheel" default="นำเข้าล้อแม็กซ์"/></g:link></li>
				<li><g:link controller="usageScore"><g:message code="default.submenu.product.usageScore" default="ตั้งค่าชนิดล้อแม็กซ์และการใช้งาน"/></g:link></li>
				<li><g:link controller="nut"><g:message code="default.submenu.product.nut" default="อะไหล่"/></g:link></li>
				<!-- <li><g:link controller="product"><g:message code="" default="รายการล้อแม็กซ์ และ อะไหล่ ทั้งหมด"/></g:link></li> -->
			</ul>
		</div>
		<hr/>
		<div class="menuSection">
			<h1><g:message code="default.submenu.car" default="รถ"/></h1>
			<ul>
				<li><g:link controller="carBand"><g:message code="default.submenu.car.carbrand" default="ยี่ห้อรถ"/></g:link></li>
				<li><g:link controller="carModel"><g:message code="default.submenu.car.carmodel" default="รุ่นรถยนต์"/></g:link></li>
				<li><g:link controller="carColor" action="carInput"><g:message code="default.submenu.car.carcolor" default="นำเข้าภาพรถยนต์"/></g:link></li>
				<li><g:link controller="carWheelList"><g:message code="default.submenu.car.carwheel" default="รายการจับคู่ล้อและรถยนต์"/></g:link></li>
			</ul>
		</div>
		<hr/>
		<div class="menuSection">
			<h1><g:message code="default.submenu.other" default="ตั้งค่าอื่นๆ"/></h1>
			<ul>
				<li><g:link controller="holiday"><g:message code="default.submenu.other.holiday"/></g:link></li>
			</ul>
		</div>
		
		</sec:ifLoggedIn>
	</div>		
			
			
			<!-- 
			<table> 
 
		
		<tr>
			<td>- <g:link controller="branch">สาขา</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="product">รายการสินค้า</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="nut">ตัวน๊อต</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carBand">ยี่ห้อรถ</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carModel">รุ่นรถยนต์ </g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carColor" action="carInput">นำเข้าภาพรถยนต์ </g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="wheelBand">ยี่ห้อล้อแม็กซ์</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="maxWheel">รุ่นล้อแม็กซ์</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="maxWheel" action="inputWheel">นำเข้าล้อแม็กซ์ </g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="usageScore">ตั้งค่าชนิดล้อแม็กซ์และการใช้งาน</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carWheelList">รายการจับคู่ล้อและรถยนต์</g:link></td>
		</tr>
		
	</table>
			 -->
			
			
			
			
			
			 
	
</body>
</html>
