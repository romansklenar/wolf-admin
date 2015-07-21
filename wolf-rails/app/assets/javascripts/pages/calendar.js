(function() {
    var page_scripts = function () {
        if (!$("#calendar").length) return;

        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        
        $('#fullcalendar').fullCalendar({
            header: {
                left: 'month,agendaWeek,agendaDay',
                center: 'title',
                right: 'today prev,next'
            },
            selectable: true,
            selectHelper: true,
            editable: true,
            events: [
                {
                    title: 'All Day Event',
                    start: new Date(y, m, 1)
                },
                {
                    title: 'Long Event',
                    start: new Date(y, m, d-5),
                    end: new Date(y, m, d-2)
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d-3, 16, 0),
                    allDay: false
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d+4, 16, 0),
                    allDay: false
                },
                {
                    title: 'Meeting',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false
                },
                {
                    title: 'Lunch',
                    start: new Date(y, m, d, 12, 0),
                    end: new Date(y, m, d, 14, 0),
                    allDay: false
                },
                {
                    title: 'Birthday Party',
                    start: new Date(y, m, d+1, 19, 0),
                    end: new Date(y, m, d+1, 22, 30),
                    allDay: false
                },
                {
                    title: 'Click for Google',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/'
                }
            ],
            eventBackgroundColor: '#278ccf'
        });
        
        // handler to close the new event popup just for displaying purposes
        // more documentation for fullcalendar on http://arshaw.com/fullcalendar/
        $("#new-event-popup .fa-times").click(function () {
            $("#new-event-popup").fadeOut("fast");
        });
    };

    $(document).on("ready page:load", page_scripts);
})();