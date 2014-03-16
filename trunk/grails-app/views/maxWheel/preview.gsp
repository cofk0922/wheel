
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
					<div class="page-header" style="height: 60px;">
						<ul class="breadcrumb first">
							<li><a href="../">เมนู</a> <span class="divider">/</span>
							<a href="../maxWheel/inputWheel">ระบบนำเข้าล้อแม็กซ์และอะไหล่(อัพโหลดรูปภาพ)</a> <span class="divider">/</span></li>
						</ul>
						<h1>รายละเอียดข้อมูลพื้นฐานรถ </h1>
					</div>
					
					<!-- image Upload-->
					
			<table style="margin-top:0;margin-left:0;">			
					<tr>
					<td>					
					<g:if test="${carImage}">
						<g:img dir="images" file="${carImage}" id="cropbox" /></g:if>		
						<%--<g:img dir="images" file="test_car.jpg" id="cropbox" />			
					--%></td>
					<td valign="top" align="left" width="30%">					
					<table>					
					<tr>
					<td> &nbsp; <b>ยี่ห้อรถ:</b></td>
					<td>					
    						${modelInstance.band.bandName}
					</td>
					</tr>					
					<tr>
					<td> &nbsp; <b>รุ่นรถ :</b></td>
					<td>
    						${modelInstance.modelName}
    						</td>
					</tr>					
					<tr>
					<td> &nbsp; <b>น้ำหนัก:</b></td>
					<td>					
    						&nbsp;${modelInstance.gearRatio} &nbsp;กิโลกรัม
					</td>
					</tr>
					<tr>
					<td> &nbsp; <b>อัตราทดเกียร์:</b></td>
					<td>					
    						&nbsp;${modelInstance.weight}
					</td>
					</tr>
					<tr>
					<td> &nbsp; <b>ค่า offSet:</b></td>
					<td>					
    						&nbsp;${modelInstance.offSet}
					</td>
					</tr>
					<tr>
					<td> &nbsp; <b>รหัส PCD:</b></td>
					<td>					
    						&nbsp;${modelInstance.pcdCode}
					</td>
					</tr>
					

					</table>
					</td>
				</tr>
			</table>		
					<div class="page-header" align="right">
						<g:link  action="detectImage" params="[carImage:carImage,modelId:modelInstance.id,colorId:colorInstance.id]">
							<input type="button" value="กำหนดจุดล้อหน้า" class="button"/> 
						</g:link>
					</div>
			
				</div>
			</div>
		</div>
	</div>
	


	
	
</body>

</html>
