<html>
<head>
<meta charset="utf-8" />
<title>Coordinates</title>
<meta name='layout' content='main'/>
<link rel="stylesheet" href="../css/mainJcrop.css" type="text/css" />
<link rel="stylesheet" href="../css/demos.css" type="text/css" />
<link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />
<link href="../css/detectImage/imgareaselect-animated.css" rel="stylesheet" type="text/css" />

<g:javascript src="jquery.min.js" />
<g:javascript src="jquery-1.6.1.min.js" />
<g:javascript src="jquery.imgareaselect.pack.js" />

<script type="text/javascript">
	function preview(img, selection) {
		if (!selection.width || !selection.height)
			return;
		var scaleX = 100 / selection.width;
		var scaleY = 100 / selection.height;
		$('#preview img').css({
			//set size Image default
			width : Math.round(scaleX * 300),
			height : Math.round(scaleY * 300),
			marginLeft : -Math.round(scaleX * selection.x1),
			marginTop : -Math.round(scaleY * selection.y1)
		});
		$('#x1').val(selection.x1);
		$('#y1').val(selection.y1);
		$('#x2').val(selection.x2);
		$('#y2').val(selection.y2);
		$('#w').val(selection.width);
		$('#h').val(selection.height);
	}
	$(function() {
		$('#photo').imgAreaSelect({
			aspectRatio : '1:1',
			handles : true,
			fadeSpeed : 200,
			onSelectChange : preview
		});
	});
	function buttonClick(btn)
	{	
	document.getElementById('hw'+btn).value=document.getElementById('h').value;
	document.getElementById('ww'+btn).value=document.getElementById('w').value;
	document.getElementById('x1w'+btn).value=document.getElementById('x1').value;
	document.getElementById('x2w'+btn).value=document.getElementById('x2').value;
	document.getElementById('y1w'+btn).value=document.getElementById('y1').value;
	document.getElementById('y2w'+btn).value=document.getElementById('y2').value;
	}
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
					<div class="page-header"  style="height: 60px;">
						<h1>กำหนดภาพล้อแม็กซ์</h1>
					</div><table>
						<tr>
							<td width=50%>
							<div><g:img dir="images" file="${wheelImage}" id="photo" width="300" height="300"/></div>
									<table>	<tr>
								
									</tr>
							</table>
							</td>
						<td align="left">&nbsp; <b>รายละเอียดรถ:</b>
						<form name="input" action="saveMaxWheel" method="post">
						<g:hiddenField name="modelId" value="${modelInstance.id}" />
						<g:hiddenField name="wheelImage" value="${wheelImage}" />
						<g:hiddenField name="hVal" value="${hVal}" />
						<g:hiddenField name="sVal" value="${sVal}" />
						<g:hiddenField name="vVal" value="${vVal}" />
						<g:hiddenField name="hexVal" value="${hexVal}" />
						<g:hiddenField name="colorName" value="${colorName}" />
								<table><tr><td colspan="2">
											<div id="preview" style="width: 100px; height: 100px; overflow: hidden; border-radius: 50%;">
												<g:img dir="images" file="${wheelImage}" />
											</div>
										</td>
									</tr>

									
									<tr>
             <td>&nbsp; <b>series:</b>
    						${modelInstance.series}
				 &nbsp; <b>รุ่นล้อแม็กซ์ :</b>
    						${modelInstance.modelName}
    		</td></tr>	
            
            <tr><td> &nbsp; <b>น้ำหนัก:</b>
    						&nbsp;${modelInstance.weight} 
					 &nbsp; <b>size:</b>			
    						&nbsp;${modelInstance.size}
			</td></tr>
			
			<tr><td> &nbsp; <b>ค่า offSet:</b>	
    						&nbsp;${modelInstance.offSet}
					 &nbsp; <b>รหัส PCD:</b>
    						&nbsp;${modelInstance.pcdCode}
			</td></tr>
            
            <tr><td> &nbsp; <b>ความกว้าง :</b>	
    						&nbsp;${modelInstance.width}
					 &nbsp; <b>ลายซี่ :</b>
    						&nbsp;${modelInstance.spoke}
			</td></tr>
			
			 <tr><td> &nbsp; <b>สถานะ:</b>	
    						&nbsp;${modelInstance.pStatus}
					 &nbsp; <b>กำหนดเป็นล้อ defalt ของรถยี่ห้อ : </b>
    						&nbsp;${modelInstance?.forCarBand?.bandName}
			</td></tr>
									
									
									
									
									
									<tr><td colspan="2" align="right"><button name="btnNext">บันทึกภาพล้อแม็กซ์</button>
								</td></tr>
								</table>
								<table style="margin-top: 1em;display: none;">
								<tr ><td>Height:<input type="text" id="h" value="0" name="Height" /></td><td>Width:<input type="text" value="0" id="w" name="Width" /></td></tr>
								<tr><td>Y<sub>1</sub>:<input type="text" id="y1" value="0" name="Y1"/></td><td><b>Y<sub>2</sub>:</b><input type="text" id="y2" value="0" name="Y2"/></td></tr>
								<tr><td>X<sub>1</sub>:<input type="text" id="x1" value="0" name="X1"/></td><td><b>X<sub>2</sub>:</b><input type="text" id="x2" value="0" name="X2"/></td></tr>
						</table>
							</form>
							</td>
						</tr>
					</table>
						
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
	</div>
</body>
</html>
