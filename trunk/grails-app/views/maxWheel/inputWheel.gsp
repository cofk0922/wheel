
<!DOCTYPE html>
<html lang="en">
<head>
<title>Live Cropping Demo</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />

<g:javascript src="jquery.min.js" />
<g:javascript src="jquery.Jcrop.js" />


  <link rel="stylesheet" href="../css/mainJcrop.css" type="text/css" />
  <link rel="stylesheet" href="../css/demos.css" type="text/css" />
  <link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />
  


<script type="text/javascript">
	$(function() {

		$('#cropbox').Jcrop({
			aspectRatio : 1,
			onSelect : updateCoords
		});

	});

	function updateCoords(c) {
		$('#x').val(c.x);
		$('#y').val(c.y);
		$('#w').val(c.w);
		$('#h').val(c.h);
	};

	function checkCoords() {
		if (parseInt($('#w').val()))
			return true;
		alert('Please select a crop region then press submit.');
		return false;
	};
</script>
<style type="text/css">
#target {
	background-color: #ccc;
	width: 500px;
	height: 330px;
	font-size: 24px;
	display: block;
}
</style>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="span12">
				<div class="jc-demo-box">

					<div class="page-header">
						<ul class="breadcrumb first">
							<li><a href="../">Menu</a> <span class="divider">/</span></li>
						</ul>
						<h1>ซอฟต์แวร์ช่วยเลือกล้อแม็กซ์</h1>
					</div>
					
					<!-- image Upload-->
					
					<g:uploadForm action="upload">
       					 <input type="file" name="myFile" />
       				 <input type="submit" />
    				</g:uploadForm>
					
				
					<!-- This is the image we're attaching Jcrop to -->
					<g:if test="${filename}">
						<g:img dir="images" file="${filename}" id="cropbox" />
					</g:if>
					<!-- This is the form that our event handler fills -->
					
					<form action="cropingImage" method="post"
						onsubmit="return checkCoords();">
						<input type="hidden" id="x" name="x" /> 
						<input type="hidden"id="y" name="y" /> 
						<input type="hidden" id="w" name="w" /> 
						<input type="hidden" id="h" name="h" /> 
						<input type="hidden" id="filename" name="filename"  value ='${filename}'/> 
						<br>
						<input type="submit" value="Crop Image" class="btn btn-large btn-inverse" />
					</form><%--

					<p> 
						<b>An example server-side crop script.</b> Hidden form values are
						set when a selection is made. If you press the <i>Crop Image</i>
						button, the form will be submitted and a 150x150 thumbnail will be
						dumped to the browser. Try it!
					</p>						
						--%>
						
						<g:if test="${fileCropName}">
						
						<div class="page-header">
						<h1> รูปภาพที่ใช้งาน</h1>
					</div>
						
						
							<g:img dir="images/crop" file="${fileCropName}" id="cropbox" />
						
						<div class="page-header">
						<g:link  action="detectColor" params="[fileCropName:fileCropName]"><h1> Step2 >> </h1></g:link>
					</div>
					
					</g:if>
					
					
				</div>
			</div>
		</div>
	</div>
	


	
	
</body>

</html>
