	var fncRender = function(data,max,min) {
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
			editable: true,
			allDaySlot: false,
			events: data,
			eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
				$('#status').text(
					event.title + " was moved " +
					dayDelta + " days and " +
					minuteDelta + " minutes."
				);
			},
			eventClick: function(event, element) {
				var title = prompt('App');
				if (title) {
					event.title = title;
				}
				$('#calendar').fullCalendar('updateEvent', event);

			},
			selectable: true,
			select: function(start,end) {
				var currentView = $('#calendar').fullCalendar('getView');
				if (currentView.name === "month") {
					$('#calendar').fullCalendar('changeView', 'agendaDay' );
					$('#calendar').fullCalendar('gotoDate', start.getFullYear(), start.getMonth(), start.getDate());
				} else {
					$.post('../appointment/validateTime', { 'startdate': start }, function(result) {
						if (result.isValid){
							var title = prompt('Appointment');
							if (title) {
								$('#calendar').fullCalendar('renderEvent',
									{
										title: title,
										start: start,
										end: end,
										allDay: false
									},
									$('#status').text(title + " was added "),
									true // make the event "stick"
									
								);
								$.post( "../appointment/saveDate", { 'title':  title, 'startdate': start});
						}
						$('#calendar').fullCalendar('unselect')
						}
					})
				}
			}
		})
	};
	
	var fncGetData = function() {		
		var date = new Date();
		$.post( "../appointment/getEvents", { 'month':  date.getMonth(), 'year':  date.getFullYear()}, function(result) {
			fncRender(result.events,result.maxtime,result.mintime);
		} );
	};
	
	$(document).ready(function() {
		fncGetData();
	});
