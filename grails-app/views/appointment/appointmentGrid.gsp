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
 
	#txtKeyword {
		margin: 0 10px 0 0;
		}

</style>
<title>รายการนัดหมายติดตั้งล้อแม็กซ์</title>
</head>
<body>
	<p>&nbsp;</p>
	<label for="txtKeyword">Search Keyword</label><input type="text" name="txtKeyword" id="txtKeyword"><button id="btnSearch">Search</button>
    <p>&nbsp;</p>
    <table id="list"><tr><td></td></tr></table>
    <div id="pager"></div> 
	
<div id="edit-event" title="แก้ไขการนัดหมาย" style="display: none">
	<p><span style="float:left; margin:0 7px 50px 0;"></span>
	</p>
</div>

<script>


var keywordStr = $('#txtKeyword').val();
var grid = $("#list").jqGrid({
       url: "../appointment/getEventsGrid",
       datatype: "json",
       mtype: "POST",
	postData: { 'searchStr': keywordStr },
	autowidth: true,
		colNames: ["ID","Appointment No","Customer Name","Car Code", "Start Date", "End Date", "Status"],
		colModel: [
			{ name: "appointmentID",resizable: false, key: true, hidden: true},
			{ name: "appointmentNo",resizable: false, width: 180, align:'right'},
			{ name: "customerName",resizable: false, width: 160 },
			{ name: "carCode",resizable: false, width: 160 },
			{ name: "startDate",resizable: false, width: 180 },
			{ name: "endDate",resizable: false, width: 180},
			{ name: "status",resizable: false, width: 300, sortable: false ,align:'center' }
		],
		pager: "#pager",
		rowNum: 10,
		rowList: [10, 20, 30],
		sortname: "appointmentNo",
		sortorder: "desc",
		viewrecords: true,
		gridview: true,
		autoencode: true,
		hidegrid: false,
		loadonce:true,
		sortable: true,
		columnReordering:false,
		loadComplete: function() {
			jQuery("#myGridID").trigger("reloadGrid"); // Call to fix client-side sorting
		},
		onSelectRow : function(rowid){
			var rowData = jQuery(this).getRowData(rowid);
			var aQryStr = '<p><span style="float:left; margin:0 7px 30px 0;" valign="center">Appointment No. ' +rowData['appointmentNo']+'</span><BR>'+
								'<span style="float:left; margin:0 7px 20px 0;">ชื่อ  :  '+rowData['customerName']+'</span></p><BR>'+
								'<span style="float:left; margin:0 7px 20px 0;">ทะเบียนรถ  :  '+rowData['carCode']+'</span></p><BR>'+
								'<span style="float:left; margin:0 7px 20px 0;">วันเวลาเริ่มนัด  :  '+ rowData['startDate']+'</span></p><BR>'+
								'<span style="float:left; margin:0 7px 20px 0;">วันเวลาสิ้นสุด  :  '+ rowData['endDate']+'</span></p><BR>'+
								'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  '+ rowData['status']+'</span></p>';
			$("#edit-event").html(aQryStr);
			$( "#edit-event" ).dialog({
				width: 'auto',
				height: 'auto',
				modal: true,
				autoOpen: false,
				buttons: {
					"ติดตั้ง": function() {
						$( this ).dialog( "close" );
					},
					"เลื่อน": function() {
						$( this ).dialog( "close" );
						window.location = "/wheel/appointment/manageCalendar?id="+ rowData['appointmentID'];
					},
					"รับรถ": function() {
						$( this ).dialog( "close" );
					}
				}
			});
			$( "#edit-event" ).dialog( 'open' );
    	    /*var aQryStr = "appointmentID = " + rowData['appointmentID'] + " & Status = " + rowData['Status'];
			$('#edit-event').html(aQryStr);
    	    $( "#edit-event" ).dialog({
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
			$( "#edit-event" ).dialog( 'open' );*/
			
		}
    	        
	});
$("#list").jqGrid('hideCol','Appointment No');

$( "#btnSearch" ).on('click', function() {
	var keywordStr = $('#txtKeyword').val();
	grid.setGridParam({postData: { 'searchStr': keywordStr },datatype:'json'}).trigger('reloadGrid');
});

 </script>
</body>
</html>