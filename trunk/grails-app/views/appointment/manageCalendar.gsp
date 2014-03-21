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
  <p valign="center"><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>ต้องการ "ย้าย" การนัดหมายของ "====="  ใช่หรือไม่ ?</p>
</div>

<div id="alert-move" title="เปลี่ยนแปลงการนัดหมาย" style="display: none">
	<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
			ไม่สามารถ "ย้าย" การนัดหมาย มายังวันที่นี้
	</p>
</div>

<div id="edit-event" title="แก้ไขการนัดหมาย" style="display: none">
	<p><span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
			ยังไม่รู้ว่าจะโชว์อะไรใน dialog นี้
	</p>
</div>

<script>


function getUrlVars() { 
    var vars = {}; 
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) { 
        vars[key] = value; 
    }); 
    return vars; 
} 


$( "#alert-move" ).dialog({
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

var fncRender = function(data,max,min,daysoff,holidays,currentEvent) {
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		maxTime: max,
		minTime: min,
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
					var yearStr = dateStr.length === 3 ? dateStr[2] : "";
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
			$.post('../appointment/validateTime', { 'id': event.id,'dayDelta':dayDelta,'minuteDelta':minuteDelta,'act': 'update' }, function(result){
				if (result.isValid){
					$( "#confirm-move" ).dialog({
						height:190,
						width: 500,
						autoOpen: false,
						modal: true,
						buttons: {
							"OK": function() {
								$.post( "../appointment/editEvent", { 'id':  event.id, 'dayDelta':dayDelta,'minuteDelta':minuteDelta,'act': 'update'});
								$( this ).dialog( "close" );
							},
							Cancel: function() {
								$( this ).dialog( "close" );
								revertFunc();
							}
						}
					});
					$( "#confirm-move" ).dialog( 'open' );
				}else{
					$( "#alert-move" ).dialog( 'open' );
					revertFunc();
				}
			});				
		},
		eventClick: function(event, element) {
			if (event.id === currentEvent.id){
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
		},
		selectable: true,
		select: function(start,end) {
			$.post('../appointment/validateTime', { 'startdate': start,'act': 'add' }, function(result) {
				if (result.isValid){
					var currentView = $('#calendar').fullCalendar('getView');
					if (currentView.name === "month") {
						$('#calendar').fullCalendar('changeView', 'agendaDay' );
						$('#calendar').fullCalendar('gotoDate', start.getFullYear(), start.getMonth(), start.getDate());
					} else {
						$( "#confirm-move" ).dialog({
							resizable: false,
							width: 'auto',
							height: 'auto',
							autoOpen: false,
							modal: true,
							buttons: {
								"OK": function() {
									$('#calendar').fullCalendar( 'removeEvents' , currentEvent.id);
									$.post( "../appointment/editEvent", { 'title':  currentEvent.title, 'startdate': start, 'act': 'update'}, function(result){
										$('#calendar').fullCalendar('renderEvent',
											{
												id: currentEvent.id,
												title: currentEvent.title,
												start: start,
												end: end,
												allDay: false,
												textColor: '#000000',
												color: '#00ff00',
												editable: true,
												durationEditable: false,
												borderColor:'#000000'
											},
										true
										);
										$('#calendar').fullCalendar('unselect')
									});
									$( this ).dialog( "close" );
								},
								Cancel: function() {
									$( this ).dialog( "close" );
								}
							}
						});
						$( "#confirm-move" ).dialog( 'open' );
					}
				}else{
					$( "#alert-move" ).dialog( 'open' );
				}
			});
		}
	}),
	$('#calendar').fullCalendar('gotoDate', currentEvent.start.getFullYear(), currentEvent.start.getMonth(), currentEvent.start.getDate());
};

var fncGetData = function() {
	$.post( "../appointment/getEventsForEdit",{ 'apID' : getUrlVars()["id"] }, function(result) {
		var data =[];
		$.each(result.events, function(i, item) {
			item.start = new Date(item.start);
			item.end = new Date(item.end);
			item.textColor = item.textColor;
			item.color = item.color;
			item.tile = item.tile;
			data.push(item);
		});
		
		var currentEvent = result.currentEvent;
		currentEvent.start = new Date(currentEvent.start);
		currentEvent.end = new Date(currentEvent.end);
		currentEvent.textColor = '#000000';
		currentEvent.color = '#00ff00';
		currentEvent.title = currentEvent.title;
		currentEvent.editable = true;
		currentEvent.durationEditable = false;
		currentEvent.borderColor = '#000000';
		data.push(currentEvent);

		fncRender(data,result.maxtime,result.mintime,result.daysoff,result.holidays,currentEvent);
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
