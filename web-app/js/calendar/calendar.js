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
		//var data = [];
		
		var data = "${remoteFunction(action:'appointment', controller:'getEvents')}";
		//$.post("../appointment/getEvents/", true, function(result) {
			//result = '{ { "title": "All Day Event", "start": "2014-03-07" }, { "title": "Long Event", "start": "2014-03-07", "end": "2014-03-10" } }';
			//var obj = $.parseJSON($('#calendar'));
			//$.each(obj, function(i, item) {
			//	data.push(item);
			//});
			
			fncRender(data);
		//});
		
		// var date = new Date();
		// var d = date.getDate();
		// var m = date.getMonth();
		// var y = date.getFullYear();
		
		// var data = [
				// {
					// title: '[ 1�� 9999 ]',
					// start: new Date(y, m, 1,11,30),
					// end: new Date(y, m, 1,12,30),
					// color: '#acacac',
					// editable: false,
					// allDay: false
				// },
				// {
					// title: '[ ���� ������� ]',
					// start: new Date(y, m, d-5,8,0),
					// end: new Date(y, m, d-2,8,0),
					// color: '#acacac',
					// editable: false,
					// allDay: false
				// },
				// {
					// id: 999,
					// title: '[ 1�� 2222 ]',
					// start: new Date(y, m, d-3, 16, 0),
					// end: new Date(y, m, d-3, 18, 0),
					// color: '#acacac',
					// editable: false,
					// allDay: false
				// },
				// {
					// id: 999,
					// title: '[ ˡ 1452 ]',
					// start: new Date(y, m, d+4, 16, 0),
					// end: new Date(y, m, d+3, 18, 0),
					// allDay: false
				// },
				// {
					// title: '[ �� 4532 ]',
					// start: new Date(y, m, d, 10, 30),
					// end: new Date(y, m, d, 14, 0),
					// allDay: false
				// },
				// {
					// title: '[ ��     2 ]',
					// start: new Date(y, m, d, 10, 30),
					// end: new Date(y, m, d, 14, 0),
					// allDay: false
					
				// },
				// {
					// title: '[ ���� ������� ]',
					// start: new Date(y, m, d, 12, 30),
					// end: new Date(y, m, d, 14, 0),
					// allDay: false
				// },
				// {
					// title: '[ �ҵԴ�����硫�ѹ��� ]',
					// start: new Date(y, m, d+1, 19, 0),
					// end: new Date(y, m, d+1, 22, 30),
					// allDay: false
				// },
				// {
					// title: '[ Click for Google ]',
					// start: new Date(y, m, 28,13,0),
					// end: new Date(y, m, 29,15,30),
					// url: 'http://google.com/',
					// allDay: false
				// }
			// ];
			
		//fncRender(data);
	};
	
	$(document).ready(function() {
		fncGetData();
	});
