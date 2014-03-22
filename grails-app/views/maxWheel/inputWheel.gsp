
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


<script  type="text/javascript">
//from an input element
var filesToUpload = input.files;
// from drag-and-drop
function onDrop(e) {
  filesToUpload = e.dataTransfer.files;
}
if (!file.type.match(/image.*/)) {
  // this file is not an image.
};
var img = document.createElement("img");
var reader = new FileReader();  
reader.onload = function(e) {img.src = e.target.result}
reader.readAsDataURL(file);

var ctx = canvas.getContext("2d");
ctx.drawImage(img, 0, 0);

var MAX_WIDTH = 800;
var MAX_HEIGHT = 600;
var width = img.width;
var height = img.height;
 
if (width > height) {
  if (width > MAX_WIDTH) {
    height *= MAX_WIDTH / width;
    width = MAX_WIDTH;
  }
} else {
  if (height > MAX_HEIGHT) {
    width *= MAX_HEIGHT / height;
    height = MAX_HEIGHT;
  }
}
canvas.width = width;
canvas.height = height;
var ctx = canvas.getContext("2d");
ctx.drawImage(img, 0, 0, width, height);

var imgData = ctx.createImageData(width, height);
var data = imgData.data;
var pixels = ctx.getImageData(0, 0, width, height);
for (var i = 0, ii = pixels.data.length; i < ii; i += 4) {
    var r = pixels.data[i + 0];
    var g =pixels.data[i + 1];
    var b = this.pixels.data[i + 2];
    data[i + 0] = (r * .393) + (g *.769) + (b * .189);
    data[i + 1] = (r * .349) + (g *.686) + (b * .168)
    data[i + 2] = (r * .272) + (g *.534) + (b * .131)
    data[i + 3] = 255;
}
ctx.putImageData(imgData, 0, 0);

var dataurl = canvas.toDataURL("image/png");
var file = canvas.mozGetAsFile("foo.png");

//Show upload
xhr.upload.addEventListener("progress", function(e) {
  if (e.lengthComputable) {
    var percentage = Math.round((e.loaded * 100) / e.total);
    // do something
}, false);

var fd = new FormData();
fd.append("name", "paul");
fd.append("image", canvas.mozGetAsFile("foo.png"));
fd.append("key", "××××××××××××");
var xhr = new XMLHttpRequest();
xhr.open("POST", "http://your.api.com/upload.json");
xhr.send(fd);

document.addEventListener("message", function(e){
    // retrieve parameters from e.data
    var key = e.data.key;
    var name = e.data.name;
    var dataurl = e.data.dataurl;
    // Upload
}
// Once the upload is done, you can send a postMessage to the original window, with URL

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
						<h1>ระบบนำเข้าล้อแม็กซ์และอะไหล่</h1>
					</div>
					
					<!-- image Upload-->
					<g:uploadForm action="detectColor">
					<table>
					<tr>
					<td>ยี่ห้อรถ  :</td>
					<td>
    						<g:select name="bandName"
							from="${listCarBand.sort{it.id}}" optionKey="id" optionValue="bandName"
							noSelection="['':'กรุณาเลือกยี่ห้อรถ']"
							onchange="${remoteFunction (
                        	controller: 'MaxWheel',
                       		action: 'inputWheel',   
							params: '\'bandId=\' + this.value',
                        	update: 'modelId' )};"/>
									
							<a href="../carBand/create.gsp">เพิ่มยี่ห้อรถ(ในกรณีที่ไม่มีข้อมูลยี่ห้อรถอยู่)</a>
					</td>
					</tr>
					<tr>
					<td>รุ่นรถ :</td>
					<td>					
    						<g:select name="modelId"
							from="${listCarModel.sort{it.id}}" optionKey="id" optionValue="modelName"
							noSelection="['':'กรุณาเลือกรุ่นรถ']"/>
					
							<a href="../carModel/index.gsp">เพิ่มรุ่นรถ(ในกรณีที่ไม่มีข้อมูลรุ่นรถอยู่)</a>
																	
					</td>
					</tr>
					<tr>
					<td><span lang="th">ลักษณะการใช้งาน :</span></td>
					<td>
					<select name="usedType">
					<option value="0">กรุณาเลือกลักษณะการใช้งาน</option>
  <option value="CITY">วิ่งเส้นทางถนนที่ราบเรียบ</option>
  <option value="LONGWAY">วิ่งระยะทางไกล</option>
  <option value="OFFROAD">วิ่งเส้นทางถนนที่ขุขระ</option>
  <option value="HEAVY">วิ่งบรรทุกของหนัก</option>
</select>
					</td></tr>
			
					<td>รูปภาพรถ  :</td>

					<td><input type="file" name="myFile" />
					
					<font color="red"> รูปภาพควรมีขาด 500x300 Pixel</font>
					
					</td>
					</tr>
			
					</table>
					<br>
						<div class="page-header" align="right">
						<g:submitButton name="กำหนดข้อมูลรถ" />
						</div>
       				 
    				</g:uploadForm>
	
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>
