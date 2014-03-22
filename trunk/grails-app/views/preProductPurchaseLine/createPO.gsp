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
 
	#ddPayType {
		margin: 0 10px 0 0;
		}

</style>

<title>รายการนัดหมายติดตั้งล้อแม็กซ์</title>
</head>

<body>
	<div id="text1">
	</div>
	<table style="margin:0 20% 0 0";><tr><td><label for="list">รายการสั่งซื้อ</label></td></tr></table>
    <table id="list"><tr><td></td></tr></table>
    <div id="pager"></div> 
	
	<div id="text2">
	</div>
	<button id="btnCancel" style="margin:10px 30px 30px 20px; float: right; width:100px; height:35px;">ยกเลิก</button>
	<button id="btnCreate" style="margin:10px 20px 30px 30px; float: right; width:100px; height:35px;">สั่งซื้อ</button>
<script>

function getUrlVars() { 
    var vars = {}; 
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) { 
        vars[key] = value; 
    }); 
    return vars; 
}

$(document).ready(function() {
	getOrdersDetails();
});

function getOrdersDetails() {

	$.post( "../preProductPurchaseLine/getVendorDetails",{ 'id' : getUrlVars()["id"] },function(result){
		var aQryStr1 = '<table style="margin:0 20% 0 0";><tr><td>เลขที่ใบสั่งซื้อ :' +result.poNo+
		'</td></tr><tr><td>วันเวลาสั่งซื้อ  :  '+ result.poDate+
		'</td><td>วันเวลาส่งสินค้า :  '+ result.arrivalDate+
		'</td></tr><tr><td>ชื่อผู้ขาย  :  '+ result.vendorName+
		'</td><td>ที่อยู่ผู้ขาย  :  '+ result.vendorAddress+
		'</td></tr><tr><td><label for="ddPayType">ประเภทการชำระเงิน</label><select id="ddPayType" name="ddPayType" style="margin:0 0 0 10%"><option value="1">เงินสด</option><option value="2">บัตรเครดิต</option></select></td></tr></table>';
		
		$("#text1").html(aQryStr1);	
			
		var aQryStr2 = '<p><span style="float:right; margin:10px 20px 7px 80%;">Total  :  '+ result.total+'</span><BR>'+
			'<span style="float:right; margin:0 20px 7px 80%;">vat  :  '+ result.vat+'</span><BR>'+
			'<span style="float:right; margin:0 20px 10px 80%;">Net Total  :  '+ result.netTotal+'</span></p>';
		$("#text2").html(aQryStr2);
	});
}

var grid = $("#list").jqGrid({
       url: "../preProductPurchaseLine/getOrderListPO",
       datatype: "json",
       mtype: "POST",
	postData: { 'id': getUrlVars()["id"] },
	autowidth: true,
		colNames: ["ลำดับที่","ชื่อสินค้า","ราคาต่อหน่วย", "จำนวน", "ราคา"],
		colModel: [
			{ name: "No",resizable: false, width: 180, align:'right'},
			{ name: "prodName",resizable: false, width: 160 },
			{ name: "unitPrice",resizable: false, width: 160 },
			{ name: "amt",resizable: false, width: 180 },
			{ name: "total",resizable: false, width: 180},
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
	});
	
$( "#btnCreate" ).on('click', function() {
	$.post( "../preProductPurchaseLine/savePO",{ 'id' : getUrlVars()["id"], 'payType': $("#ddPayType").val()});
});

$( "#btnCancel" ).on('click', function() {
	window.location = "/wheel/preProductPurchaseLine/orderGrid";
});

 </script>
</body>
</html>