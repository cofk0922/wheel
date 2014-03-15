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
 
		
		<tr>
			<td>- <g:link controller="branch">สาขา</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="product">รายการสินค้า</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carBand">ยี่ห้อรถ</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carModel">รุ่นรถยนต์ </g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carColor">รายการรถยนต์ </g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="wheelBand">ยี่ห้อล้อแม็กซ์</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="maxWheel">รุ่นล้อแม็กซ์</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="usageScore">ตั้งค่าชนิดล้อแม็กซ์และการใช้งาน</g:link></td>
		</tr>
		<tr>
			<td>- <g:link controller="carWheelList">รายการจับคู่ล้อและรถยนต์</g:link></td>
		</tr>
		
	</table>
			
			
			
			
			
			
			 
	
</body>
</html>
