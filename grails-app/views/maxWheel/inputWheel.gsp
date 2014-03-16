
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
            height: Math.round(scaleY * 300),
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
							<li><a href="../">เมนู</a> <span class="divider">/</span>
							
							
							
							</li>
						</ul>
						<h1>ระบบนำเข้าล้อแม็กซ์และอะไหล่</h1>
					</div>
					
					<!-- image Upload-->
					
					<g:uploadForm action="detectColor">
					<table>
					
					<tr>
					<td>ยี่ห้อรถ  :</td>
					<td>
					
    						<g:if test="${carInstance}">
    						${carInstance.bandName}
    						</g:if>
    						<g:else>
    						<g:select name="bandName"
							from="${listCarBand.sort{it.id}}" optionKey="id" optionValue="bandName"
							noSelection="['':'กรุณาเลือกยี่ห้อรถ']"/>
							</g:else>
							<a href="../carBand/create.gsp">เพิ่มยี่ห้อรถ(ในกรณีที่ไม่มีข้อมูลยี่ห้อรถอยู่)</a>

					</td>
					</tr>
					
					<tr>
					<td>รุ่นรถ :</td>
					<td>
	
						<g:if test="${modelInstance}">
    						${modelInstance.modelName}
    						</g:if>
    						<g:else>
    						<g:select name="modelId"
							from="${listCarModel.sort{it.id}}" optionKey="id" optionValue="modelName"
							noSelection="['':'กรุณาเลือกรุ่นรถ']"/>
							</g:else>	
							
							
							<a href="../carModel/index.gsp">เพิ่มรุ่นรถ(ในกรณีที่ไม่มีข้อมูลรุ่นรถอยู่)</a>									
					</td>
					</tr>
			
					<td>รูปภาพรถ  :</td>

					<td><input type="file" name="myFile" />
					
					<font color="red"> รูปภาพควรมีขาด 500x300 Pixel</font>
					
					</td>
					</tr>
			
					</table>
					<br>

						<g:submitButton name="กำหนดข้อมูลรถ"/>
       				 
    				</g:uploadForm>
	
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>
