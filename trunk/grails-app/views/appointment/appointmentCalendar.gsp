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

var fncRender = function(data,max,min,daysoff,holidays) {
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		maxTime: max,
		minTime: min,
		//hiddenDays: [ 0, 6 ],
		//weekends : false,
		defaultEventMinutes: 30, 
		editable: false,
		allDaySlot: false,
		events: data,
		eventAfterAllRender: function() {
			$.each(holidays, function(i, item) {
				$('[data-date="' + item.day + '"]').addClass("holiday");
			});
			//Case 2: Every dayoff
			$.each(daysoff, function(i, item) {
			$('.fc-'+item.day+':not(.fc-day-header)').addClass("dayoff");
			});				
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
								$('#calendar').fullCalendar('renderEvent',
									{
										id: result.id,
										title: result.title,
										start: result.start,
										end: end,
										allDay: false,
									},
								$('#status').text(title + " was added "),
								true // make the event "stick"
								
								);
								$('#calendar').fullCalendar('unselect')
							});
						}
					}
				}else{
					alert("You can't Add this day!!!");
				}
			})
		}
	})
};

var fncGetData = function() {
	$.post( "../appointment/getEvents", function(result) {
		var data =[];
		$.each(result.events, function(i, item) {
			item.start = new Date(item.start);
			item.end = new Date(item.end);
			item.textColor = '#008e8e';
			item.color = '#008e8e';
			item.tile = '';
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

<title>ตารางนัดหมายติดตั้งล้อแม็กซ์</title>
</head>
<body>
<div class = 'calendar' id='calendar'></div>
<div id='status'></div>
</body>
</html>
