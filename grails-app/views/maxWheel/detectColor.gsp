

<html lang="en">
<head>
<title>Live Cropping Demo</title>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />

         <link href="../css/detectColor/main.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../js/detectColor/jquery-1.5.2.min.js"></script><%--
        <script type="text/javascript" src="../js/detectColor/script.js"></script>
--%>

<script type="text/javascript">
  var canvas;
var ctx;

var images = [ 
               '${fileCropName}'
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
    }); 

    $('#swImage').click(function(e) { // switching images
        iActiveImage++;
        if (iActiveImage >= 10) iActiveImage = 0;
        image.src = images[iActiveImage];
    });
});
</script>

</head>
<body>

	
<div class="container">
            <div class="column1">
                <canvas id="panel" width="450" height="228"></canvas>
            </div>
            <div class="column2">
                <!--<div><input type="button" value="Next image" id="swImage" /></div>-->
                <div>Preview:</div>
                <div id="preview"></div>
                <div>Color:</div>
                <div>R: <input type="text" id="rVal" disabled="disabled" /></div>
                <div>G: <input type="text" id="gVal" disabled="disabled" /></div>
                <div>B: <input type="text" id="bVal" disabled="disabled" /></div>
                <div>RGB: <input type="text" id="rgbVal" disabled="disabled" /></div>
                <div>RGBA: <input type="text" id="rgbaVal" disabled="disabled" /></div>
                <div>HEX: <input type="text" id="hexVal" disabled="disabled" /></div>
                <hr />
            </div>
            <div style="clear:both;"></div>
        </div>

					
					
					
					
					
					
					
					<div class="page-header">
						<g:link  action="detectColor" params="[fileCropName:fileCropName]"><h1> Step3 >> </h1></g:link>
					</div>
	
</body>

</html>
