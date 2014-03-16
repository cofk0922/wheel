<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Coordinates</title>

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
			width : Math.round(scaleX * 500),
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
						<ul class="breadcrumb first" >
							<li><a href="../">เมนู</a> <span class="divider">/</span> <a
								href="../maxWheel/inputWheel">ระบบนำเข้าล้อแม็กซ์และอะไหล่</a> <span
								class="divider">/</span></li>
								
						</ul>
						<h1>
							กำหนดจุด <font color="red">ล้อหน้า</font>
						</h1>

					</div>
					<form name="input" action="detectImageBack" method="post">

						<g:hiddenField name="modelId" value="${modelInstance.id}" />
						<g:hiddenField name="carImage" value="${carImage}" />
						<g:hiddenField name="hVal" value="${hVal}" />
						<g:hiddenField name="sVal" value="${sVal}" />
						<g:hiddenField name="vVal" value="${vVal}" />
						<g:hiddenField name="hexVal" value="${hexVal}" />
						<g:hiddenField name="colorName" value="${colorName}" />
					<table border="0">
						<tr>
							<td width="70%"><g:img dir="images"
									file="${carImage}" id="photo" width="500" height="300" />
							</td>
							<td valign="top">&nbsp; <b>รายละเอียดรถ:</b><br></br>
								<table>
									<tr>
										<td>&nbsp; <b>ยี่ห้อรถ:</b></td>
										<td>
											${modelInstance.band.bandName}
										</td>
									</tr>
									<tr>
										<td>&nbsp; <b>รุ่นรถ :</b></td>
										<td>
											${modelInstance.modelName}
										</td>
									</tr>
									<tr>
										<td>&nbsp; <b>น้ำหนัก:</b></td>
										<td>&nbsp;${modelInstance.gearRatio} &nbsp;กิโลกรัม
										</td>
									</tr>
									<tr>
										<td>&nbsp; <b>อัตราทดเกียร์:</b></td>
										<td>&nbsp;${modelInstance.weight}
										</td>
									</tr>
									<tr>
										<td>&nbsp; <b>ค่า offSet:</b></td>
										<td>&nbsp;${modelInstance.offSet}
										</td>
									</tr>
									<tr>
										<td>&nbsp; <b>รหัส PCD:</b></td>
										<td>&nbsp;${modelInstance.pcdCode}
										</td>
									</tr>
									<tr>
										<td>&nbsp; <b>รูปล้อหน้าที่:</b></td>
										<td>
											<div id="preview"
												style="width: 100px; height: 100px; overflow: hidden; border-radius: 50%;">
												<g:img dir="images" file="${carImage}" />
											</div>
										</td>
									</tr>
								</table>

							</td>
						</tr>
					</table>
						<table style="margin-top: 1em;">
							<thead>
								<tr>
									<th colspan="2"
										style="font-size: 110%; font-weight: bold; text-align: left; padding-left: 0.1em;">
										Coordinates</th>
									<th colspan="2"
										style="font-size: 110%; font-weight: bold; text-align: left; padding-left: 0.1em;">
										Dimensions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 10%;"><b>X<sub>1</sub>:
									</b></td>
									<td style="width: 30%;">
									
									<input type="text" id="x1" value="0" name="frontX1" />
										
										</td>
									<td style="width: 20%;"><b>Width:</b></td>
									<td>
									<input type="text" value="0" id="w" name="frontWidth" />
										
										
										</td>
								</tr>
								<tr>
									<td><b>Y<sub>1</sub>:
									</b></td>
									<td><input type="text" id="y1" value="0" name="frontY1"
										/></td>
									<td><b>Height:</b></td>
									<td><input type="text" id="h" value="0" name="frontHeight"
										/></td>
								</tr>
								<tr>
									<td><b>X<sub>2</sub>:
									</b></td>
									<td><input type="text" id="x2" value="0" name="frontX2"
										 /></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><b>Y<sub>2</sub>:
									</b></td>
									<td><input type="text" id="y2" value="0" name="frontY2"
										 /></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>

						<div class="page-header" align="right">
							<g:submitButton name="กำหนดจุดล้อหลัง" />
						</div>
				</div>
				<div style="clear: both;"></div>
			</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
