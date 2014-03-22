<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<link href='../css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='../css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='../css/calendar/calendar.css' rel='stylesheet' />
<link href="../css/grid/jquery-ui-1.10.4.custom.css" rel="stylesheet">
<script src='../js/jquery.min.js'></script>
<script src='../js/jquery-ui-1.10.4.custom.min.js'></script>
<script src='../js/calendar/fullcalendar.min.js'></script>
<script src="../js/jquery-ui-1.10.4.custom.js"></script>

<title>ตารางติดตั้งล้อแม็กซ์</title>
</head>
<body>
<p>&nbsp;</p>
<div class = 'calendar' id='calendar'></div>

<div id="edit-event" title="การติดตั้ง" style="display: none">
	<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
			ยังไม่รู้ว่าจะโชว์อะไรใน dialog นี้
	</p>
</div>

<script>

function dateformat(dateObj){
	return dateObj.getFullYear()+"-"+(dateObj.getMonth()+1)+"-"+dateObj.getDate() +" "+ dateObj.getHours()+":"+ ((dateObj.getMinutes()< 10) ? ("0"+dateObj.getMinutes()):dateObj.getMinutes());
}

var fncRender = function(data,max,min,daysoff,holidays,gotoStart) {
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		maxTime: max,
		minTime: min,
		defaultView: 'agendaDay',
		defaultEventMinutes: 30,
		editable: false,
		allDaySlot: false,
		events: data,
		eventRender: function(event, element) {
		      element.find(".fc-event-time").append(" " + event.title);
		},
	    timeFormat:'h(:mm)t',
	    eventAfterAllRender: function() {
			$.each(holidays, function(i, item) {
				if ($('[data-date="' + item.day + '"]').length > 0) {
					$('[data-date="' + item.day + '"]').addClass("holiday");
				} else {
					var dateStr = item.day.split("-");
					var monthStr = dateStr.length === 3 ? dateStr[1] : ""; 
					var dateStr = dateStr.length === 3 ? dateStr[2] : "";
					if (monthStr !== "" && dateStr !== "") {
						var selectorStr = parseInt(monthStr, 10) + '/' + parseInt(dateStr, 10);
						var col = $(':contains("' + selectorStr + '")');
						if (col.length > 0) {
							var classSelector = col.last().attr("class");
							if (classSelector.split(" ").length > 1)	{
								var classArr = classSelector.split(" ");
								$('.' + classArr[0] + '.' + classArr[1]).addClass("holiday");
							}								
						}
					}
				}					
			});
			//Case 2: Every dayoff
			$.each(daysoff, function(i, item) {
			$('.fc-'+item.day+':not(.fc-day-header)').addClass("dayoff");
			});				
		},
		eventClick: function(event, element) {
			$.post( "../installation/getEventDetails", { 'id':  event.id }, function(result) {
				var aQryStr = '<p><span style="float:left; margin:0 7px 30px 0;" align="center">Appointment No. ' +result.appointmentNo+'</span><BR>'+
									'<span style="float:left; margin:0 7px 20px 0;">ชื่อ  :  '+result.customerName+'</span></p><BR>'+
									'<span style="float:left; margin:0 7px 20px 0;">ทะเบียนรถ  :  '+result.carNo+'</span></p><BR>'+
									'<span style="float:left; margin:0 7px 20px 0;">วันเวลาเริ่มนัด  :  '+ dateformat(event.start)+'</span></p><BR>'+
									'<span style="float:left; margin:0 7px 20px 0;">วันเวลาสิ้นสุด  :  '+ dateformat(event.end)+'</span></p><BR>';		
//				NEW,
//		PREPARE_INSTALL,
//		READY_INSTALL,
//		INSTALLING,
//		FINISHED,
//		CANCEL
				var buttonlist = {"ปิด": function() {$( this ).dialog( "close" )}};
				
				if (result.status === "NEW"){
					aQryStr = aQryStr+'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  รายการใหม่</span></p>';
					buttonlist = {
					
						"เบิกของ": function() {
							$( this ).dialog( "close" );
							$.post( "../installation/updateStatus", { 'id': event.id, 'nextStatus': "PREPARE_INSTALL" });
						}
						,"ปิด": function() {
							$( this ).dialog( "close" );
						}
					};
				}
				else if (result.status === "PREPARE_INSTALL")
				{
					aQryStr = aQryStr+'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  กำลังเตรียมการติดตั้ง</span></p>';
				}
				else if (result.status === "READY_INSTALL")
				{
					aQryStr = aQryStr+'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  พร้อมติดตั้ง</span></p>';
					buttonlist = {
						"ทำการติดตั้ง": function() {
							$( this ).dialog( "close" );
							$.post( "../installation/updateStatus", { 'id': event.id, 'nextStatus': "INSTALLING" });
						},"ปิด": function() {
							$( this ).dialog( "close" );
						}
					};
				}
				else if (result.status === "INSTALLING")
				{
					aQryStr = aQryStr+'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  กำลังติดตั้ง</span></p>';
					buttonlist = {
						"ติดตั้งเสร็จ": function() {
							$( this ).dialog( "close" );
							$.post( "../installation/updateStatus", { 'id': event.id, 'nextStatus': "FINISHED" });
						},
						"ปิด": function() {
							$( this ).dialog( "close" );
						}
					};
				}
				else if (result.status === "FINISHED")
				{
					aQryStr = aQryStr+'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  ติดตั้งเรียบร้อย</span></p>';
				}
				else{
					aQryStr = aQryStr+'<span style="float:left; margin:0 7px 20px 0;">สถานะ  :  ไม่ทราบ</span></p>';
				}
				
				$("#edit-event").html(aQryStr);
				
				$( "#edit-event" ).dialog({
					width: 'auto',
					height: 'auto',
					modal: true,
					autoOpen: false,
					buttons: buttonlist
				});
				$( "#edit-event" ).dialog( 'open' );
			});
		},
		selectable: true,
		select: function(start,end) {
			var currentView = $('#calendar').fullCalendar('getView');
			if (currentView.name === "month") {
				$('#calendar').fullCalendar('changeView', 'agendaDay' );
				$('#calendar').fullCalendar('gotoDate', start.getFullYear(), start.getMonth(), start.getDate());
			}
		}
	})
};

var fncGetData = function() {		
	$.post( "../installation/getAllEvents", function(result) {
		var data =[];
		$.each(result.events, function(i, item) {
			item.start = new Date(item.start);
			item.end = new Date(item.end);
			item.tile = item.tile;
			data.push(item);
		});

		fncRender(data,result.maxtime,result.mintime,result.daysoff,result.holidays);
	} );
};

$(document).ready(function() {
	fncGetData();
});


</script>
<style>

	.calendar body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		overflow: auto
		
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		
		}

</style>


</body>
</html>
