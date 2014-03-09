	var fncRender = function(data) {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
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
				var title = prompt('�Ѵ����');
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
					var title = prompt('�Ѵ����');
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
					}
					$('#calendar').fullCalendar('unselect')
				}
			},
		})
	};
	
	var fncGetData = function() {		
//		$.post('../appointment/jSonList', function(result) {
//			fncRender(result);
//		});		
		var date = new Date();
		$.post( "../appointment/getEvents", { 'month':  date.getMonth(), 'year':  date.getFullYear()}, function(result) {
			fncRender(result);
		} );
	};
	
	$(document).ready(function() {
		fncGetData();
	});
