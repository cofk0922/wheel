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
</head>
<body>
	<p>&nbsp;</p>
	<label for="txtKeyword">Search Keyword</label><input type="text" name="txtKeyword" id="txtKeyword"><button id="btnSearch">Search</button>
    <p>&nbsp;</p>
    <table id="list"><tr><td></td></tr></table>
    <div id="pager"></div> 
	
<div id="edit-event" title="แก้ไขการนัดหมาย" style="display: none">
	<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
			ยังไม่รู้ว่าจะโชว์อะไรใน dialog นี้
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
           { name: "appointmentID", key: true, hidden: true},
           { name: "appointmentNo", width: 180, align:'right'},
           { name: "CustomerName", width: 160 },
           { name: "CarCode", width: 160 },
           { name: "StartDate", width: 180 },
           { name: "EndDate", width: 180},
           { name: "Status", width: 300, sortable: false ,align:'center' }
       ],
       pager: "#pager",
       rowNum: 10,
       rowList: [10, 20, 30],
       sortname: "appointmentid",
       sortorder: "desc",
       viewrecords: true,
       gridview: true,
       autoencode: true,
       hidegrid: false,
       onSelectRow : function(rowid){
    	   var rowData = jQuery(this).getRowData(rowid); 
    	    var appointmentID = rowData['appointmentID'];
    	    var Status = rowData['Status'];
    	    
    	    var aQryStr = "appointmentID = " + appointmentID + " & Status = " + Status;

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
			$( "#edit-event" ).dialog( 'open' );
       }
    	        
   });

$("#list").jqGrid('hideCol','Appointment No');

$( "#btnSearch" ).on('click', function() {
	var keywordStr = $('#txtKeyword').val();
	grid.setGridParam({postData: { 'searchStr': keywordStr }}).trigger('reloadGrid');
});

 </script>
</body>
</html>