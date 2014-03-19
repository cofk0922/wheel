<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta name='layout' content='main'/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/mainJcrop.css" type="text/css" />
<link rel="stylesheet" href="../css/demos.css" type="text/css" />
<link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />
<link href="../css/detectImage/imgareaselect-animated.css" rel="stylesheet" type="text/css" />
<title>Untitled 1</title>
<style>
div.img
  {
  margin:5px;
  padding: 5px;
  border:1px solid #0000ff;
  height:auto;
  width:auto;
  float:left;
  text-align:center;
  }
div.img img
  {
  display:inline;
  margin:5px;
  border:1px solid #ffffff;
  }
div.img a:hover img
  {
  border:1px solid #0000ff;
  }
div.desc
  {
  text-align:center;
  font-weight:normal;
  width:120px;
  margin:5px;
  }

</style>
<script type="text/javascript">
function ChangeWheel(imgSrc){
var src=imgSrc;
document.getElementById('imgWheel1').src=src;
document.getElementById('imgWheel1').width=document.getElementById('w').value;
document.getElementById('imgWheel1').height=document.getElementById('h').value;
//document.getElementById('imgWheel1').style.marginTop=Integer.toString((Integer.parseInt(document.getElementById('y1').value);+10))+'px';
document.getElementById('imgWheel1').style.marginTop=document.getElementById('y1').value+'px';
document.getElementById('imgWheel1').style.marginLeft=document.getElementById('x1').value+'px';
//document.getElementById("imgWheel1").style.marginRight=document.getElementById('x2').value+'px';
//document.getElementById("imgWheel1").style.marginBottom=document.getElementById('y2').value+'px';

document.getElementById('imgWheel2').src=src;
document.getElementById('imgWheel2').width=document.getElementById('ww').value;
document.getElementById('imgWheel2').height=document.getElementById('hh').value;
//document.getElementById("imgWheel2").style.marginTop=Integer.toString((Integer.parseInt(document.getElementById('yy1').value);+10))+'px';
document.getElementById("imgWheel2").style.marginTop=document.getElementById('yy1').value+'px';
document.getElementById("imgWheel2").style.marginLeft=(document.getElementById('xx1').value-document.getElementById('x2').value)+'px';
//document.getElementById("imgWheel2").style.marginRight=document.getElementById('xx1').value+'px';
//document.getElementById("imgWheel2").style.marginBottom=document.getElementById('yy2').value+'px';
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
					<form name="input" action="imageInput" method="post">
						<g:hiddenField name="modelId" value="${modelInstance.id}" />
						<g:hiddenField name="carImage" value="${carImage}" />
						<g:hiddenField name="hVal" value="${hVal}" />
						<g:hiddenField name="sVal" value="${sVal}" />
						<g:hiddenField name="vVal" value="${vVal}" />
						<g:hiddenField name="hexVal" value="${hexVal}" />
						<g:hiddenField name="colorName" value="${colorName}" />
						<g:hiddenField name="frontX1" value="${frontX1}" />
						<g:hiddenField name="frontX2" value="${frontX2}" />
						<g:hiddenField name="frontY1" value="${frontY1}" />
						<g:hiddenField name="frontY2" value="${frontY2}" />
						<g:hiddenField name="frontWidth" value="${frontWidth}" />
						<g:hiddenField name="frontHeight" value="${frontHeight}" />
						<g:hiddenField name="backX1" value="${backX1}" />
						<g:hiddenField name="backX2" value="${backX2}" />
						<g:hiddenField name="backY1" value="${backY1}" />
						<g:hiddenField name="backY2" value="${backY2}" />
						<g:hiddenField name="backWidth" value="${backWidth}" />
						<g:hiddenField name="backHeight" value="${backHeight}" />
					<div class="page-header"  style="height: 60px;">
						<h1>เลือกล้อแม็กซ์</h1>
					</div>
					<table border="0">
						<tr>
							<td width="50%">
							<div style="background-image:url(${carImage});width:500px;height:300px;">
							<img id="imgWheel1" style="border-radius: 50%;"/><img id="imgWheel2"  style="border-radius: 50%;"/> 
							</div>
							</td>
			<td>
			<table>
							<tr>
										<td><input type="checkbox" name="chkColor" value="Color"/><b>เหมาะสมกับสีรถ</b></td>
										<td><b>Max Size :</b><select name="maxSize" style="width:80px">
					<option value="0">เลือก</option>
  <option value="17">ขอบ 17"</option>
  <option value="18">ขอบ 18"</option>
  <option value="19">ขอบ 19"</option>
  <option value="22">ขอบ 22"</option>
</select></td></tr>
				<tr>
				<td>&nbsp;<b>ยี่ห้อแม็กซ์ :</b><label id="lblmaxBrand">Lenso</label></td>
				<td>&nbsp;<b>รุ่นแม็กซ์ :</b><label id="lblmaxModel">VENOM2-HIGHT</label></td>
				</tr>
				<tr>
				<td>&nbsp;<b>รายละเอียด :</b><label id="lblmaxDesc">น้ำหนักเบา</label></td>
				<td>&nbsp;<b>หน้ากว้าง /PCD:</b><label id="lblmaxModel">-6 / S/123</label></br></td>
				</tr>
				<tr>
					<td>&nbsp;ความเหมาะสมในการใช้งาน:<label id=""></label></td>
					<td>
					<img src="/wheel/static/images/imgStar5.png" width="100" height="40"/></td>
				</tr>
				<tr>
					<td>&nbsp;อัตราการสิ้นเปลืองพลังงาน:<label id=""></label></td>
					<td ><img src="/wheel/static/images/imgStar4.png" width="100" height="40"/></td>
				</tr>
				<tr>
					<td>&nbsp;ความหนืดของการออกตัว :<label id=""></label></td>
					<td ><img src="/wheel/static/images/imgStar3.png" width="100" height="40"/></td>
				</tr>
							</table>

			</td>
</tr>
<tr><td colspan="2">
<table style="width: 100%">
				<tr>
					<td>
					<img src="/wheel/static/images/imgBefore2.PNG" width="40" height="40"/></td>
					<td><div class="img"><img src="/wheel/static/images/images5.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg1').innerHTML);"/>
</div> <div class="desc"><label id="lblImg1" style="visibility:hidden">/wheel/static/images/images5.jpg</label></div>
</td><td><div class="img"><img src="/wheel/static/images/images3.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg2').innerHTML);"/>
</div> <div class="desc"><label id="lblImg2" style="visibility:hidden">/wheel/static/images/images3.jpg</label></div>
</td>
					<td><div class="img"><img src="/wheel/static/images/images6.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg3').innerHTML);"/>
</div> <div class="desc"><label id="lblImg3" style="visibility:hidden">/wheel/static/images/images6.jpg</label></div>
</td>
					<td><div class="img"><img src="/wheel/static/images/images22.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg4').innerHTML);"/>
</div> <div class="desc"><label id="lblImg4" style="visibility:hidden">/wheel/static/images/images22.jpg</label></div>
</td>
					<td><div class="img"><img src="/wheel/static/images/images44.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg5').innerHTML);"/>
</div> <div class="desc"><label id="lblImg5" style="visibility:hidden">/wheel/static/images/images44.jpg</label></div>
</td>
					<td><img src="/wheel/static/images/imgAfter2.png" height="40" width="40"/></td>
				</tr>
			</table>
</td></tr>
<tr>
<td>						
							<table>
							<tr><td colspan="2">&nbsp;<b>รายละเอียดรถ:</b></td></tr>
							<tr>
										<td>&nbsp; <b>ยี่ห้อรถ:</b>${modelInstance.band.bandName}</td>
										<td>&nbsp; <b>รุ่นรถ :</b>${modelInstance.modelName}</td>
									</tr>
									<tr>
										<td>&nbsp; <b>น้ำหนัก:</b>&nbsp;${modelInstance.gearRatio} &nbsp;กิโลกรัม</td>
										<td>&nbsp; <b>อัตราทดเกียร์:</b>&nbsp;${modelInstance.weight}</td>
									</tr>
									<tr>
										<td>&nbsp; <b>ค่า offSet:</b>&nbsp;${modelInstance.offSet}</td>
										<td>&nbsp; <b>รหัส PCD:</b>&nbsp;${modelInstance.pcdCode}</td>
									</tr>
									<tr>
										<td>&nbsp; <b>ลักษณะการใช้งาน:</b>&nbsp;${modelInstance.offSet}</td>
										<td></td>
									</tr>
								</table>

</td>
<td>

<table>
			<tr>
					<td colspan="2">&nbsp;<b>ค่าใช้จ่าย</b></td>
				</tr>
				<tr>
					<td>&nbsp;<b>ราคา :</b><label id="lblCost">14,0000 บาท</label></td>
					<td>&nbsp;<b>ภาษีมูลค่าเพิ่ม  :</b><label id="lblTex">143.88 บาท</label></td>
				</tr>
				<tr>
				<td>&nbsp;<b>ราคารวมสุทธิ  :</b><label id="lblsumCost">14,143.88 บาท</label></td>
				<td>&nbsp;<b>วันที่ :เวลา ติดตั้ง  :</b><label id="lbldateTime">23/03/57 : 13.00-14.30 น.</label></td>
				</tr>
				<tr>
					<td align="left"><button id="btnSubmit" style="width: 100px">ยืนยัน</button></td>
					<td align="right"><button id="btnCancel" style="width: 100px">เลือกใหม่</button></td>
				</tr>
			</table>

</td>
</tr>
<tr><td colspan="2">
<table style="visibility:hidden">
 <tr>
          <td style="width: 10%;"><b>X<sub>1</sub>:marginLeft</b></td>
 		      <td style="width: 30%;"><input type="text" id="x1" value="${frontX1}" /><input type="text" id="xx1" value="${backX1}" /></td>
 		      <td style="width: 20%;"><b>Width:</b></td>
   		    <td><input type="text"  id="w"  value="${frontWidth}"/><input type="text"  id="ww"  value="${backWidth}"/></td>
        </tr>
        <tr>
          <td><b>Y<sub>1</sub>:marginTop</b></td>
          <td><input type="text" id="y1" value="${frontY1}" /><input type="text" id="yy1" value="${backY1}" /></td>
          <td><b>Height:</b></td>
          <td><input type="text" id="h" value="${frontHeight}" /><input type="text" id="hh" value="${backHeight}" /></td>
        </tr>
        <tr>
          <td><b>X<sub>2</sub>:marginRight</b></td>
          <td><input type="text" id="x2" value="${frontX2}" /><input type="text" id="xx2" value="${backX2}" /></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><b>Y<sub>2</sub>:marginBottom</b></td>
          <td><input type="text" id="y2" value="${frontY2}" /><input type="text" id="yy2" value="${backY2}" /></td>
          <td></td>
          <td></td>
        </tr>

</table>
</td></tr>
</table>
</form></div></div></div></div>
</body>
</html>
