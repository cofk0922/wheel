<g:applyLayout name="main">
<html>
	<head>
		<title><g:layoutTitle/></title>
		<style>
			div.layoutmain
			{
				overflow: hidden;
			}
			
			div.layoutnavleft
			{
				width: 210px; 
				float: left; 
				padding: 0; 
				margin: 0; 
				border: 0;
				padding-bottom: 0.5em;
			}
			
			div.layoutcontent
			{
				width: 745px; 
				height: 110%;
				float: left; 
				padding: 0; 
				margin: 0; 
				border: 0;
				padding-left:5px;
				padding-bottom: 0.5em;
				overflow: auto;
			}
		</style>
		<g:layoutHead/>
	</head>
	<body>
		<div class="layoutmain">
			<div class="layoutnavleft">
				<g:pageProperty name="page.navleft"/>
			</div>
			<div class="layoutcontent">
				<g:pageProperty name="page.content"/>
				<g:layoutBody/>
			</div>
		</div>
	</body>
</html>
</g:applyLayout>