
<!DOCTYPE html>
<html lang="en">
<head>
<title>Live Cropping Demo</title>
		<meta name='layout' content='main'>
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
						<h1>ระบบนำเข้าล้อแม็กซ์</h1>
					</div>
					
					<!-- image Upload-->
					
					<g:uploadForm action="detectWheelColor">
				
					<input type="hidden" id="modelId" name="modelId" value="${modelInstance.id}">
					
					<table>
					<tr>
					<td>ยี่ห้อล้อแม็กซ์  :</td>
					<td>
    						
    						<%--<g:select name="wheelName"
							from="${listWheelBand.sort{it.id}}" optionKey="id" optionValue="name"
							noSelection="['':'กรุณาเลือกยี่ห้อล้อแมกซ์']"
							 onchange="${remoteFunction (
                        controller: 'MaxWheel',
                        action: 'findModelForBand',   
						params: '\'band.id=\' + this.value',
                        update: 'modelSelection' 
              			)};"         
							
							
							/>
							
							
							--%>${modelInstance.band.name}
							
							</font>





					</td>
					</tr>
					
					<tr>
					<td>รุ่นล้อแม็กซ์ :</td>
					<td>
	
					
					
					<%--<div id="modelSelection">
							<g:render template="../layouts/modelSelection" />
						</div>
					
					
					
					
    						<g:select name="modelId"
							from="${listWheelModel.sort{it.id}}" optionKey="id" optionValue="series"
							noSelection="['':'กรุณาเลือกรุ่นล้อแม็กซ์']"/>
						
							<a href="../maxWheel/create">เพิ่มรุ่นล้อแม็กซ์(ในกรณีที่ไม่มีข้อมูลรุ่นล้อแม็กซ์)</a>		
							--%>
							
							${modelInstance.modelName}							
					</td>
					</tr>
					
			
					<td>รูปภาพล้อแม็กซ์  :</td>

					<td><input type="file" name="myFile" />
					
					<font color="red"> รูปภาพควรมีขาด 300x300 Pixel</font>
					<%--<div style="background-color:black"> f</div>
					--%></td>
					</tr>
			
					</table>
					<br>
						<div class="page-header" align="right">
						<g:submitButton name="กำหนดข้อมูลล้อแม็กซ์" />
						</div>
       				 
    				</g:uploadForm>
	
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>
