<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<link href='../css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='../css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href='../css/calendar/calendar.css' rel='stylesheet' />
<script src='../js/calendar/lib/jquery.min.js'></script>
<script src='../js/calendar/lib/jquery-ui.custom.min.js'></script>
<script src='../js/calendar/fullcalendar.min.js'></script>
<script>

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
		eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
			$.post('../appointment/validateTime', { 'id': event.id,'dayDelta':dayDelta,'minuteDelta':minuteDelta,'act': 'update' }, function(result){
				if (result.isValid){
					if (!confirm("Are you sure about this change?")) {
						revertFunc();
					}else{
						$.post( "../appointment/editEvent", { 'id':  event.id, 'dayDelta':dayDelta,'minuteDelta':minuteDelta,'act': 'update'});
						$('#status').text(
						event.title + " was moved " +
						dayDelta + " days and " +
						minuteDelta + " minutes."
						);
					}
				}else{
					alert("Event can't change for this time");
					revertFunc();
				}
			});				
		},
		eventClick: function(event, element) {
			if (confirm("Are you sure to remove this event?")) {
				$.post( "../appointment/editEvent", { 'id':  event.id,'act': 'remove'});
				$('#calendar').fullCalendar( 'removeEvents' , event.id);
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
						var title = prompt('Appointment');
						if (title) {
							$.post( "../appointment/editEvent", { 'title':  title, 'startdate': start, 'act': 'add'}, function(result){
								console.log(result);
								$('#calendar').fullCalendar('renderEvent',
									{
										id: result.id,
										title: result.title,
										start: result.start,
										end:	end,
										allDay: result.allDay
									},
								$('#status').text(title + " was added "),
								true // make the event "stick"
								
								);
								$('#calendar').fullCalendar('unselect')
							});
						}
					}
				}else{
					alert("can't Add this day!!!");
				}
			})
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

<title>ตารางติดตั้งล้อแม็กซ์</title>
</head>
<body>
<p>&nbsp;</p>
<div class = 'calendar' id='calendar'></div>
<div id='status'></div>
</body>
</html>
