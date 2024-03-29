<html lang="en" >
    <head>
        <meta charset="utf-8"/>
        <title>Image color picker</title>
        <meta name='layout' content='main'/>
        <link href="../css/detectImage/main.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../js/detectColor/jquery-1.5.2.min.js"></script>
        <script type="text/javascript" src="../js/detectColor/script.js"></script>
        
        <link rel="stylesheet" href="../css/mainJcrop.css" type="text/css" />
 		<link rel="stylesheet" href="../css/demos.css" type="text/css" />
  		<link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />
   		<link href="../css/detectImage/imgareaselect-animated.css" rel="stylesheet" type="text/css"/>

		<g:javascript src="jquery.min.js" />
		<g:javascript src="jquery-1.6.1.min.js" />
		<g:javascript src="jquery.imgareaselect.pack.js" />
             
  <script type="text/javascript">
        var canvas;
        var ctx;
        var images = [ 
                      '${wheelImage}'
       ];
        var iActiveImage = 0;

        $(function(){

            // drawing active image
            var image = new Image();
            image.onload = function () {
                ctx.drawImage(image, 0, 0, image.width, image.height); // draw the image on the canvas
            }
            image.src = images[iActiveImage];

            // creating canvas object
            canvas = document.getElementById('panel');
            ctx = canvas.getContext('2d');

            $('#panel').mousemove(function(e) { // mouse move handler
                var canvasOffset = $(canvas).offset();
                var canvasX = Math.floor(e.pageX - canvasOffset.left);
                var canvasY = Math.floor(e.pageY - canvasOffset.top);

                var imageData = ctx.getImageData(canvasX, canvasY, 1, 1);
                var pixel = imageData.data;

                var pixelColor = "rgba("+pixel[0]+", "+pixel[1]+", "+pixel[2]+", "+pixel[3]+")";
                $('#preview').css('backgroundColor', pixelColor);
            });

            $('#panel').click(function(e) { // mouse click handler
                var canvasOffset = $(canvas).offset();
                var canvasX = Math.floor(e.pageX - canvasOffset.left);
                var canvasY = Math.floor(e.pageY - canvasOffset.top);

                var imageData = ctx.getImageData(canvasX, canvasY, 1, 1);
                var pixel = imageData.data;

                $('#rVal').val(pixel[0]);
                $('#gVal').val(pixel[1]);
                $('#bVal').val(pixel[2]);

                

                $('#rgbVal').val(pixel[0]+','+pixel[1]+','+pixel[2]);
                $('#rgbaVal').val(pixel[0]+','+pixel[1]+','+pixel[2]+','+pixel[3]);
                var dColor = pixel[2] + 256 * pixel[1] + 65536 * pixel[0];
                $('#hexVal').val( '#' + dColor.toString(16) );

                rgb2hsv ( $('#rVal').val(),$('#gVal').val(),$('#bVal').val())

            }); 

            $('#swImage').click(function(e) { // switching images
                iActiveImage++;
                if (iActiveImage >= 10) iActiveImage = 0;
                image.src = images[iActiveImage];
            });
        });




        
function rgb2hsv (r,g,b) {
		var computedH = 0;
 		var computedS = 0;
 		var computedV = 0;

 //remove spaces from input RGB values, convert to int
 var r = parseInt( (''+r).replace(/\s/g,''),10 ); 
 var g = parseInt( (''+g).replace(/\s/g,''),10 ); 
 var b = parseInt( (''+b).replace(/\s/g,''),10 ); 

 if ( r==null || g==null || b==null ||
     isNaN(r) || isNaN(g)|| isNaN(b) ) {
   alert ('Please enter numeric RGB values!');
   return;
 }
 if (r<0 || g<0 || b<0 || r>255 || g>255 || b>255) {
   alert ('RGB values must be in the range 0 to 255.');
   return;
 }
 r=r/255; g=g/255; b=b/255;
 var minRGB = Math.min(r,Math.min(g,b));
 var maxRGB = Math.max(r,Math.max(g,b));

 // Black-gray-white
 if (minRGB==maxRGB) {
  computedV = minRGB;
  return [0,0,computedV];
 }

 // Colors other than black-gray-white:
 var d = (r==minRGB) ? g-b : ((b==minRGB) ? r-g : b-r);
 var h = (r==minRGB) ? 3 : ((b==minRGB) ? 1 : 5);
 computedH = 60*(h - d/(maxRGB - minRGB));
 computedS = ((maxRGB - minRGB)/maxRGB)*100;
 computedV = maxRGB*100;
 document.getElementById('hVal').value=parseInt(computedH);
 document.getElementById('sVal').value=parseInt(computedS);
 document.getElementById('vVal').value=parseInt(computedV);

// return [computedH,computedS,computedV];
}
        </script>
    </head>
    <body  >
    
    <div class="container">
		<div class="row">
			<div class="span12">
				<div class="jc-demo-box">
					<div class="page-header"  style="height: 60px;">
						<h1>กำหนดสีของแม็กซ์</h1>
					</div>
     <form name="input" action="detectWheelImage" method="post">
						<g:hiddenField name="modelId" value="${modelInstance.id}" />
						<g:hiddenField name="wheelImage" value="${wheelImage}" />
			<table>
			<tr><td >
			<canvas id="panel" width="300" height="300"></canvas>
            </td>
            <td>
            <table><tr><td>
            <div>Preview:</div>
                <div id="preview"></div> <br>
                 <div>รหัสสี : <input type="text" id="hexVal" name="hexVal" ></div>  <br>
                  <div>ชื่อสี : <input type="text" id="colorName" name="colorName" ></div>  
            </td>
            </tr>
            <tr><td> 
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
            
           <tr><td>
			<div class="page-header" align="left"><g:submitButton name="บันทึกสีล้อแมกซ์"/>
			</div>
			</td></tr>
            </table></td>
            </table>
            <div style="clear:both;"></div>
			
</div></div></div></div>
        
 		<table><tr><td>
                <div style="display: none;">R: <input type="text" id="rVal" ></div>
                <div style="display: none;">G: <input type="text" id="gVal" ></div>
                <div style="display: none;">B: <input type="text" id="bVal" ></div>
                
                
                <div ><input type="hidden" id="hVal" name="hVal"></div>
                <div > <input type="hidden" id="sVal" name="sVal"></div>
                <div ><input type="hidden" id="vVal" name="vVal"></div>
                
                
                <div style="display: none;">RGB:<input type="text" id="rgbVal" ></div>
  				<div style="display: none;">RGBA: <input type="text" id="rgbaVal" ></div><%--
                <div style="display: none;">HEX: <input type="text" id="hexVal" name="hexVal" ></div>   
                <div style="display: none;">Color Name: <input type="text" id="colorName" name="colorName" value="Color"></div>   
                --%></td></tr>			
  		</table>
  		
  		</form>
    </body>
</html>