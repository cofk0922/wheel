<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <link href='../css/grid/jquery-ui-1.10.4.custom.css' rel='stylesheet' />
 <link href='../css/grid/ui.jqgrid.css' rel='stylesheet' />
 <script src='../js/jquery.min.js'></script>
 <script src="../js/jquery-1.11.0.min.js"></script>
<script src="../js/i18n/grid.locale-en.js"></script>
<script src="../js/jquery.jqGrid.min.js"></script>
<script src='../js/jquery-ui-1.10.4.custom.min.js'></script>
<script src="../js/jquery-ui-1.10.4.custom.js"></script>

 <style>
 
	#ddVendor {
		margin: 0 10px 0 0;
		}

</style>

<title>รายการสั่งซื้อสินค้า</title>
</head>

<body>
	<p>&nbsp;</p>
	<label for="ddVendor" style="margin:0 7px 0 10px;">ผู้ขาย</label>
	<select id="ddVendor" name="ddVendor"></select><button id="btnCreatePO" style="margin:0 20px 0 10px; float: right; width:100px; height:35px;">สั่งซื้อ</button>
    <p>&nbsp;</p>
    <table id="list"><tr><td></td></tr></table>
    <div id="pager"></div> 

<div id="alert" title="ข้อความแจ้งเตือน" style="display: none">
	<p><span style="float:left; margin:0 7px 50px 0;"></span>
			กรุณาเลือก "ผู้ขาย" ทางขวา บน ของตารางด้วยค่ะ
	</p>
</div>	
	
<script>

$( "#alert" ).dialog({
	width: 'auto',
	height: 'auto',
	modal: true,
	autoOpen: false,
	buttons: {
		Ok: function() {
			$( this ).dialog( "close" );
		}
	}
});

$(document).ready(function() {
	getDDVendor();
});

function getDDVendor() {

	$.post( "../preProductPurchaseLine/getVendorList",function(result){
		console.log(result);
		$.each(result, function(val,text) {
			$('#ddVendor').append($('<option></option>').val(val).html(text));
		});
	});
}

var grid = $("#list").jqGrid({
       url: "../preProductPurchaseLine/getOrderList",
       datatype: "json",
       mtype: "POST",
	postData: { 'id': "0" },
	autowidth: true,
		colNames: ["ID","ชื่อสินค้า","จำนวน","ชื่อผู้ขาย"],
		colModel: [
			{ name: "appointmentID",resizable: false, key: true, hidden: true},
			{ name: "productName",resizable: false, width: 180, align:'center'},
			{ name: "purschaseAmt",resizable: false, width: 160,align:'center' },
			{ name: "suggestVendorName",resizable: false, width: 160,align:'center' },
		],
		pager: "#pager",
		rowNum: 10,
		rowList: [10, 20, 30],
		sortname: "productName",
		sortorder: "asc",
		viewrecords: true,
		gridview: true,
		autoencode: true,
		hidegrid: false,
		loadonce:true,
		sortable: true,
    	        
	});

	
$( "#ddVendor" ).on('change', function() {
	var ddValue = $('#ddVendor').val();
	grid.setGridParam({postData: { 'id': ddValue },datatype:'json'}).trigger('reloadGrid');
});

$( "#btnCreatePO" ).on('click', function() {
	var ddValue = $('#ddVendor').val();
	if (ddValue === "0"){
		$( "#alert" ).dialog( 'open' );
	}else{
		window.location = "/wheel/preProductPurchaseLine/createPO?id="+ ddValue;
	}
});

 </script>
</body>
</html>