
<!DOCTYPE html>
<html lang="en">
<head>
<title>Live Cropping Demo</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />




  <link rel="stylesheet" href="../css/mainJcrop.css" type="text/css" />
  <link rel="stylesheet" href="../css/demos.css" type="text/css" />
  <link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />
  


 <script type="text/javascript">
    function preview(img, selection) {
        if (!selection.width || !selection.height)
            return;

        var scaleX = 100 / selection.width;
        var scaleY = 100 / selection.height;

        $('#preview img').css({
            width: Math.round(scaleX * 500),
            height: Math.round(scaleY * 281),
            marginLeft: -Math.round(scaleX * selection.x1),
            marginTop: -Math.round(scaleY * selection.y1)
        });

        $('#x1').val(selection.x1);
        $('#y1').val(selection.y1);
        $('#x2').val(selection.x2);
        $('#y2').val(selection.y2);
        $('#w').val(selection.width);
        $('#h').val(selection.height);
    }

    $(function () {
        $('#photo').imgAreaSelect({
            aspectRatio: '1:1', handles: true,
            fadeSpeed: 200, onSelectChange: preview
        });
    });
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
					<table>
					
					<tr>
					<td>ยี่ห้อรถ</td>
					<td><g:textField name="modelName" /></td>
					</tr>
					
					<tr>
					<td>รุ่นรถ</td>
					<td><g:textField name="modelName" /></td>
					</tr>
					
					<tr>
					<td>รูปภาพรถ</td>
					<td><input type="file" name="myFile" /></td>
					</tr>
			
					</table>
					<br>
       				 <input type="submit" value="ตกลง" />
    				</g:uploadForm>

					<!-- Detect image -->
					
					<g:if test="${filename}">
						<g:img dir="images" file="${filename}" id="cropbox" />
						
				
						
						<div class="page-header">
						<g:link  action="detectImage" params="[filename:filename]"><h1> Step2 >> </h1></g:link>
					</div>
					
					</g:if>
					
				</div>
			</div>
		</div>
	</div>
	


	
	
</body>

</html>
