	var fncRender = function(min,max,dayoff,holidays) {
		$('#calendar').fullcalendar({
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
			events: fncGetData,
			eventAfterAllRender: function() {
				//Case 1: Specify date for holiday
				
				//var arr = ["2014-03-15", "2014-03-25"];
				
				//for (i = 0; i < arr.length; i += 1) {
				//	$('[data-date="' + arr[i] + '"]').addClass("holiday");
				//}
				// var holidays = [
					// { day: "2014-03-15" },
					// { day: "2014-03-25" }
				// ];
				
				$.each(holidays, function(i, item) {
					$('[data-date="' + item.day + '"]').addClass("holiday");
				});

				//Case 2: Every daysoff
				$.each(dayoff, function(i, item) {
				$('.fc-'+item.day+':not(.fc-day-header)').addClass("daysoff");
				}				
			}
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
		});
	};
	
	var fncGetData = function(start, end, callback) {
		//var param = [];
		//param.push({ start: start });
		//param.push({ end: end });
		
		// var date = new Date();
			// $.post( "../appointment/getEvents", { 'month':  date.getMonth(), 'year':  date.getFullYear()}, function(result) {
				// fncRender(result.events,result.maxtime,result.mintime);
			// } );
			
		$.post( "../appointment/getEvents", { 'start':  start, 'end':  end}, function(result) {
				$.each(result.events, function(i, item) {
					var eventObj = {
						id: result.id,
						title: result.title,
						start: result.start,
						end:	end,
						allDay: result.allDay
					};
					$('#calendar').fullcalendar('renderEvent', eventObj);
				});
			}
		});
	};
	
	var fncGetSetting = function() {		
		var date = new Date();
		$.post( "../appointment/getSettingCalendar", function(result) {
			fncRender(result.mintime,result.maxtime,result.dayoff,result.holidays);
		} );
	};
	
	$(document).ready(function() {
		fncGetSetting();
	});
