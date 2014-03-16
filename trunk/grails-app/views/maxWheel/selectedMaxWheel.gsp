<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/main.css" rel="stylesheet" type="text/css"/>
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
.style8 {
	border-right: 1px solid #C0C0C0;
	border-bottom: 1px solid #C0C0C0;
	border-collapse: collapse;
	border-left-style: solid;
	border-left-width: 1px;
	border-top-style: solid;
	border-top-width: 1px;
}
</style>
<script type="text/javascript">
function ChangeWheel(imgSrc){
var src=imgSrc;
document.getElementById('imgWheel1').src=src;
document.getElementById('imgWheel1').width=document.getElementById('w').value;
document.getElementById('imgWheel1').height=document.getElementById('h').value;
document.getElementById('imgWheel1').style.marginTop=document.getElementById('y1').value+'px';
//document.getElementById("imgWheel1").style.marginRight=document.getElementById('x2').value+'px';
//document.getElementById("imgWheel1").style.marginBottom=document.getElementById('y2').value+'px';
document.getElementById('imgWheel1').style.marginLeft=document.getElementById('x1').value+'px';
document.getElementById('imgWheel2').src=src;
document.getElementById('imgWheel2').width=document.getElementById('ww').value;
document.getElementById('imgWheel2').height=document.getElementById('hh').value;
document.getElementById("imgWheel2").style.marginTop=document.getElementById('yy1').value+'px';
//document.getElementById("imgWheel2").style.marginRight=document.getElementById('xx1').value+'px';
//document.getElementById("imgWheel2").style.marginBottom=document.getElementById('yy2').value+'px';
document.getElementById("imgWheel2").style.marginLeft=(document.getElementById('xx1').value-document.getElementById('x2').value)+'px';

//
}
function ChangeWheel2(){
document.getElementById('imgWheel2').src="Images/btnNext1.jpg";
document.getElementById('imgWheel2').width=document.getElementById('ww').value;
document.getElementById('imgWheel2').height=document.getElementById('hh').value;
document.getElementById("imgWheel2").style.marginTop=document.getElementById('yy1').value+'px';
//document.getElementById("imgWheel2").style.marginRight=document.getElementById('xx1').value+'px';
//document.getElementById("imgWheel2").style.marginBottom=document.getElementById('yy2').value+'px';
document.getElementById("imgWheel2").style.marginLeft=(document.getElementById('xx1').value-document.getElementById('x2').value)+'px';
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
	<table style="width:940px;" cellspacing="0" cellpadding="0" align="center" class="MaxFont"  >
		<tr>
			<td style="height: 80px; width: 142px;" valign="top">
			<table style="width: 100%" cellspacing="0" cellpadding="0" class="style8">
				<tr style="height:10px">
					<td style="height: 20px; width: 20px;">&nbsp;</td>
					<td style="height: 20px; "></td>
					<td style="height: 20px; "></td>
					<td style="height: 20px; "></td>
					<td style="height: 20px" class="style14"></td>
				</tr>
				<tr>
					<td style="height: 20px; width: 20px;">&nbsp;</td>
					<td style="height: 20px; "><span lang="th">ยี่ห้อรถ :</span></td>
					<td style="height: 20px; "><select>
  <option value="volvo">Honda</option>
  <option value="saab">Volvo</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select></td>
					<td style="height: 20px; "><span lang="th">ปีที่ผลิต :</span></td>
					<td style="height: 20px"><select>
  <option value="volvo">2012</option>
  <option value="saab">2010</option>
  <option value="mercedes">2008</option>
  <option value="audi">2005</option>
</select></td>
				</tr>
				<tr style="height:20px">
					<td style="width: 20px">&nbsp;</td>
					<td></td>
					<td></td>
					<td></td>
					<td ></td>
				</tr>

				<tr>
					<td style="width: 20px">&nbsp;</td>
					<td><span lang="th">รุ่นรถ :</span></td>
					<td><select>
  <option value="volvo">City</option>
  <option value="saab">Jazz</option>
  <option value="mercedes">Civic</option>
  <option value="audi">Accord</option>
</select></td>
					<td><span lang="th">ลักษณะการใช้งาน :</span></td>
					<td ><select>
  <option value="volvo">วิ่งในเมือง</option>
  <option value="saab">วิ่งทางไกล</option>
  <option value="mercedes">วิ่งต่างจังหวัด</option>
  <option value="audi">วิ่งน้อย</option>
</select></td>
				</tr>
				<tr>
					<td style="width: 20px;">&nbsp;</td>
					<td style="height: 20px;"></td>
					<td style="height: 20px;"></td>
					<td style="height: 20px;"></td>
					<td style="height: 20px" ><input type="checkbox" name="chkColor" value="Color">เหมาะสมกับสีรถ<br></td>
				</tr>
				
				</table>
			</td>
			<td style="width: 10px"></td>
			<td valign="top">
			<table style="width: 100%" cellspacing="0" cellpadding="0" class="style8">
			<tr>
					<td style="height: 10px" colspan="2"><span lang="th"></td>
				</tr>
				<tr>
					<td style="height: 20px" colspan="2"><span lang="th">&nbsp;ค่าใช้จ่าย</span></td>
				</tr>
				<tr style="height:20px">
					<td ><span lang="th">&nbsp;ราคา </span>:</td>
					<td ><label id="">14,0000 บาท</label></td>
				</tr>

				<tr>
					<td ><span lang="th">&nbsp;ภาษีมูลค่าเพิ่ม </span>:</td>
					<td  ><label id="">143.88 บาท</label></td>
				</tr>
				<tr>
					<td style="height: 20px;"><span lang="th">&nbsp;ราคารวมสุทธิ </span>:</td>
					<td style="height: 20px;" ><label id="">14,143.88 บาท</label></td>
				</tr>
				<tr>
					<td><span lang="th">&nbsp;วันที่ :เวลา ติดตั้ง</span></td>
					<td><label id="">23/03/57 : 13.00-14.30 น.</label></td>
				</tr>
				<tr>
					<td></td>
					<td><button id="btnSubmit" style="width: 100px">ยืนยัน</button>&nbsp;<button id="btnCancel" style="width: 100px">เลือกใหม่</button></td>
				</tr>
					<tr>
					<td style="height: 10px" colspan="2"><span lang="th"></td>
				</tr>
				</table>
</td>		
		</tr>
		<tr>
			<td style="width: 142px; height: 10px;"></td>
			<td style="height: 10px; width: 10px">
			</td>
			<td style="height: 10px"></td>		
		</tr>

<tr>
			<td rowspan="3" style="width: 142px"> 
			<div class="style11" style="background-image:url('/wheel/static/images/car01.jpg');width:500px;height:336px;">
   <table><tr><td><img id="imgWheel1" style="border-radius: 50%;"/></td><td><img id="imgWheel2"  style="border-radius: 50%;"/></td></tr></table>           
 </div>
</td>
			<td style="width: 10px"></td>
			<td valign="top">
			<table style="width: 100%" cellspacing="0" cellpadding="0" class="style8">
			<tr>
					<td style="height: 10px;" colspan=2></td>
				</tr>
			<tr>
					<td style="height: 20px;" colspan=2><span lang="th">&nbsp;รายละเอียดล้อแม็กซ์</span></td>
				</tr>
				<tr>
					<td style="height: 20px; "><span lang="th">&nbsp;ยี่ห้อแม็กซ์ :</span></td>
					<td style="height: 20px"><label id="brand">Lenso</label></td>
				</tr>
				<tr>
					<td s><span lang="th">&nbsp;รุ่นแม็กซ์ :</span><label id=""></label></td>
					<td ><label id="">VENOM2-HIGHT</label></td>
				</tr>
				<tr>
					<td ><span lang="th">&nbsp;รายละเอียด :</span><label id=""></label></td>
					<td ><label id="">น้ำหนักเบา</label></td>
				</tr>
				<tr>
					<td ><span lang="th">&nbsp;หน้ากว้าง :</span><label id=""></label></td>
					<td ><label id="">-6</label></td>
				</tr>
	<tr>
					<td ><span lang="th">&nbsp;PCD :</span><label id=""></label></td>
					<td ><label id="">S/123</label></td>
				</tr>
<tr>
					<td style="height: 10px;" colspan=2></td>
				</tr>
				</table>
			</td>	
		</tr>

<tr>
			<td style="height: 11px; width: 10px"></td>
			<td style="height: 11px"></td>		
		</tr>

<tr>
			<td style="width: 10px">&nbsp;</td>
			<td valign="top">
			<table style="width: 100%" cellspacing="0" cellpadding="0" class="style8" >
			<tr>
					<td style="height: 10px" class="style15" colspan="2">
				</tr>
				<tr>
					<td style="height: 20px" class="style15" colspan="2">
					<span lang="th">&nbsp;ประสิทธิภาพการใช้งาน</span></td>
				</tr>
				<tr>
					<td><span lang="th">&nbsp;ความเหมาะสมในการใช้งาน:</span><label id=""></label></td>
					<td >
					<img src="/wheel/static/images/imgStar5.png" width="100" height="30"/></td>
				</tr>
				<tr>
					<td><span lang="th">&nbsp;อัตราการสิ้นเปลืองพลังงาน:</span><label id=""></label></td>
					<td ><img src="/wheel/static/images/imgStar4.png" width="100" height="30"/></td>
				</tr>
				<tr>
					<td><span lang="th">&nbsp;ความหนืดของการออกตัว :</span><label id=""></label></td>
					<td ><img src="/wheel/static/images/imgStar3.png" width="100" height="30"/></td>
				</tr>
	<tr>
					<td style="height: 10px" class="style15" colspan="2">
				</tr>
				</table>

			</td>		
		</tr>

<tr>
			<td style="height: 10px; width: 142px;"></td>
			<td style="width: 10px; height: 10px;"></td>
			<td style="height: 10px">

			</td>		
		</tr>

<tr>
			<td style="height: 100px;" colspan="3">
			<table style="width: 100%">
				<tr>
					<td>
					<img src="/wheel/static/images/imgBefore2.PNG" width="40" height="40"/></td>
					<td><div class="img"><img src="/wheel/static/images/wl1.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg1').innerHTML);"/>
</div> <div class="desc"><label id="lblImg1" style="visibility:hidden">/wheel/static/images/wl1.jpg</label></div>
</td><td><div class="img"><img src="/wheel/static/images/wl1.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg1').innerHTML);"/>
</div> <div class="desc"><label id="lblImg2" style="visibility:hidden">/wheel/static/images/wl1.jpg</label></div>
</td>
					<td><div class="img"><img src="/wheel/static/images/wl1.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg1').innerHTML);"/>
</div> <div class="desc"><label id="lblImg3" style="visibility:hidden">/wheel/static/images/wl1.jpg</label></div>
</td>
					<td><div class="img"><img src="/wheel/static/images/wl1.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg1').innerHTML);"/>
</div> <div class="desc"><label id="lblImg4" style="visibility:hidden">/wheel/static/images/wl1.jpg</label></div>
</td>
					<td><div class="img"><img src="/wheel/static/images/wl1.jpg" style="border-radius: 50%;" width="100" height="100" onclick="ChangeWheel(document.getElementById('lblImg1').innerHTML);"/>
</div> <div class="desc"><label id="lblImg5" style="visibility:hidden">/wheel/static/images/wl1.jpg</label></div>
</td>
					<td><img src="/wheel/static/images/imgAfter2.png" height="40" width="40"/></td>
				</tr>
			</table>
			</td>
		</tr>
<tr><td>
<table style="visibility:hidden">
 <tr>
          <td style="width: 10%;"><b>X<sub>1</sub>:marginLeft</b></td>
 		      <td style="width: 30%;"><input type="text" id="x1" value="39" /><input type="text" id="xx1" value="353" /></td>
 		      <td style="width: 20%;"><b>Width:</b></td>
   		    <td><input type="text" value="99" id="w" /><input type="text" value="99" id="ww" /></td>
        </tr>
        <tr>
          <td><b>Y<sub>1</sub>:marginTop</b></td>
          <td><input type="text" id="y1" value="198" /><input type="text" id="yy1" value="195" /></td>
          <td><b>Height:</b></td>
          <td><input type="text" id="h" value="99" /><input type="text" id="hh" value="99" /></td>
        </tr>
        <tr>
          <td><b>X<sub>2</sub>:marginRight</b></td>
          <td><input type="text" id="x2" value="135" /><input type="text" id="xx2" value="445" /></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><b>Y<sub>2</sub>:marginBottom</b></td>
          <td><input type="text" id="y2" value="297" /><input type="text" id="yy2" value="287" /></td>
          <td></td>
          <td></td>
        </tr>

</table>
</td></tr>
	</table>
</body>
