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
<title>ตารางนัดหมายติดตั้งล้อแม็กซ์</title>
</head>
<body>

<p>&nbsp;</p>
<div class = 'calendar' id='calendar'></div>

<div id="confirm-move" title="เปลี่ยนแปลงการนัดหมาย" style="display: none">
  <p><span style="float:left; margin:0 7px 20px 0;" valign="center"></span></p>
</div>

<div id="confirm-add" title="เปลี่ยนแปลงการนัดหมาย" style="display: none">
  <p><span style="float:left; margin:0 7px 20px 0;" valign="center"></span></p>
</div>

<div id="alert-date" title="เปลี่ยนแปลงการนัดหมาย" style="display: none">
	<p><span style="float:left; margin:0 7px 50px 0;"></span>
			ไม่สามารถ "ย้าย" การนัดหมาย มายังวันเวลานี้
	</p>
</div>

<div id="alert-month" title="เปลี่ยนแปลงการนัดหมาย" style="display: none">
	<p><span style="float:left; margin:0 7px 50px 0;"></span>
			ไม่สามารถ "ย้าย" การนัดหมาย มายังวันที่นี้
	</p>
</div>

<div id="confirm-event" title="บันทึกการนัดหมาย" style="display: none">
</div>

<script>

function dateformat(dateObj){
	return dateObj.getFullYear()+"-"+(dateObj.getMonth()+1)+"-"+dateObj.getDate() +" "+ dateObj.getHours()+":"+ ((dateObj.getMinutes()< 10) ? ("0"+dateObj.getMinutes()):dateObj.getMinutes());
}

$( "#alert-date" ).dialog({
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

$( "#alert-month" ).dialog({
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

var fncRender = function(data,max,min,daysoff,holidays,newevent,details) {
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		maxTime: max,
		minTime: min,
		snapMinutes:30,
		defaultEventMinutes: 30, 
		editable: false,
		allDaySlot: false,
		defaultView: 'agendaWeek',
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
		eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
			$.post('../appointment/validateDeltaTime', { 'id': event.title,'dayDelta':dayDelta,'minuteDelta':minuteDelta }, function(result){
				if (result.isValid){
					var aQryStr = "ต้องการ 'ย้าย' การนัดหมายของ " +event.title+" ใช่หรือไม่ ?";
					$('#confirm-move').html(aQryStr);
					$( "#confirm-move" ).dialog({
						width: 'auto',
						height: 'auto',
						autoOpen: false,
						modal: true,
						buttons: {
							"ตกลง": function() {
								$( this ).dialog( "close" );
								$('#calendar').fullCalendar('unselect')
							},
							"ยกเลิก": function() {
								$( this ).dialog( "close" );
								revertFunc();
								$('#calendar').fullCalendar('unselect')
							}
						}
					});
					$( "#confirm-move" ).dialog( 'open' );
				}else{
					$( "#alert-date" ).dialog( 'open' );
					revertFunc();
				}
			});				
		},
		eventClick: function(event, element) {
			if (event.id === newevent.id){
				var aQryStr = '<p><span style="float:center; margin:0 10px 7px 0;"> Appointment No. ' +details.appointmentNo+
				'</span><BR>&nbsp;<BR><label for="name">ชื่อลูกค้า</label><input type="text" name="name" id="name" style="margin-bottom:12px; width:95%; padding: .4em;"><BR>'+
				'<label for="carCode" >ทะเบียนรถ</label><input type="text" name="carCode" id="carCode" value="" style="margin-bottom:12px; width:95%; padding: .4em;"><BR>'+
				'<label for="tel" >เบอร์โทรศํพท์</label><input type="text" name="tel" id="tel" value="" style="margin-bottom:12px; width:95%; padding: .4em;"><BR>'+
				'<label for="address" >ที่อยู่</label><textarea name="address" id="address" style="width:95%; height:50px"></textarea><BR>&nbsp;<BR>'+
				'<span style="float:left; margin:0 10px 7px 0;">วันเวลาเริ่มนัด  :  '+ dateformat(event.start)+'</span><BR>'+
				'<span style="float:left; margin:0 10px 7px 0;">วันเวลาสิ้นสุด  :  '+ dateformat(event.end)+'</span><BR>'+
				'<span style="float:left; margin:0 10px 7px 0;">ค่าใช้จ่าย  :  '+ details.price+'</span></p>';
			
				$("#confirm-event").html(aQryStr);
				$( "#confirm-event" ).dialog({
					width: 'auto',
					height: 'auto',
					modal: true,
					autoOpen: false,
					buttons: {
						"บันทึก": function() {
							$( this ).dialog( "close" );
							$.post( "../appointment/saveEvent", { 'start':  event.start,'name': $('#name').val(),'carCode' : $('#carCode').val(),'tel' : $('#tel').val(), 'address': $('textarea#address').val()});
							$('#calendar').fullCalendar('unselect')
						},
						"ยกเลิก": function() {
							$( this ).dialog( "close" );
							$('#calendar').fullCalendar('unselect')
						}
					}
				});
				$( "#confirm-event" ).dialog( 'open' );
			}
		},
		selectable: true,
		select: function(start,end) {
			var currentView = $('#calendar').fullCalendar('getView');
			if (currentView.name === "month") {
				$.post('../appointment/validateSelectTime', { 'id': newevent.id,'startDate': start.getFullYear()+"-"+(start.getMonth()+1)+"-"+start.getDate(), 'time': null}, function(result) {
					if (result.isValid){
						$('#calendar').fullCalendar('changeView', 'agendaDay' );
						$('#calendar').fullCalendar('gotoDate', start.getFullYear(), start.getMonth(), start.getDate());
					}
					else
					{
						$( "#alert-month" ).dialog( 'open' );
					}
				});
			}
			else
			{
				$.post('../appointment/validateSelectTime', { 'id': newevent.id,'startDate': start.getFullYear()+"-"+(start.getMonth()+1)+"-"+start.getDate(), 'time': start.getHours()+":"+start.getMinutes()}, function(result) {
				if (result.isValid){
					var aQryStr = "ต้องการ 'ย้าย' การนัดหมายของ " +newevent.title+" ใช่หรือไม่ ?";
					$('#confirm-add').html(aQryStr);
					$( "#confirm-add" ).dialog({
						resizable: false,
						width: 'auto',
						height: 'auto',
						autoOpen: false,
						modal: true,
						buttons: {
							"OK": function() {
								$('#calendar').fullCalendar( 'removeEvents' , newevent.id);
								$('#calendar').fullCalendar('renderEvent',
									{
										id: newevent.id,
										title: newevent.title,
										start: start,
										end: end,
										allDay: false,
										textColor: '#000000',
										color: '#00ff00',
										editable: true,
										durationEditable: false,
										borderColor:'#000000'
									},
								true);
								$( this ).dialog( "close" );
								$('#calendar').fullCalendar('unselect')
							},
							Cancel: function() {
								$( this ).dialog( "close" );
								$('#calendar').fullCalendar('unselect')
							}
						}
					});
					$( "#confirm-add" ).dialog( 'open' );
				}else{
					$( "#alert-date" ).dialog( 'open' );
				}
			})
			}
		}
	});
	$('#calendar').fullCalendar('gotoDate', newevent.start.getFullYear(), newevent.start.getMonth(), newevent.start.getDate());
};

var fncGetData = function() {
	$.post( "../appointment/getEventsForCreate", function(result) {
		var data =[];
		$.each(result.events, function(i, item) {
			item.start = new Date(item.start);
			item.end = new Date(item.end);
			item.color = '#008e8e';
			item.title = '';
			data.push(item);
		});

		var newevent = result.newevent;
		newevent.start = new Date(newevent.start);
		newevent.end = new Date(newevent.end);
		newevent.textColor = '#000000';
		newevent.color = '#00ff00';
		newevent.title = newevent.title;
		newevent.editable = true;
		newevent.durationEditable = false;
		newevent.borderColor = '#000000';
		data.push(newevent);
		
		fncRender(data,result.maxtime,result.mintime,result.daysoff,result.holidays,newevent,result.details);
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
		margin: 0 auto;
		}
</style>



</body>
</html>
