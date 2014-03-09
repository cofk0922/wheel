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
				var currentView = $('#calendar').fullCalendar('getView');
				if (currentView.name === "month") {
					$('#calendar').fullCalendar('changeView', 'agendaDay' );
					$('#calendar').fullCalendar('gotoDate', start.getFullYear(), start.getMonth(), start.getDate());
				} else {
					$.post('../appointment/validateTime', { 'startdate': start,'act': 'add' }, function(result) {
						if (result.isValid){
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
