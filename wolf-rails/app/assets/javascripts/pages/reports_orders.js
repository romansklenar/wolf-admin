(function () {
    var page_scripts = function () {
        if (!$("#reports").length) return;
        
        var chart_border_color = "#efefef";
        var chart_color = "#b0b3e3";

        /* sales chart */
    
        var d = [[utils.get_timestamp(18), 1245], [utils.get_timestamp(17), 1290], [utils.get_timestamp(16), 1230], [utils.get_timestamp(15), 1290], [utils.get_timestamp(14), 1250], [utils.get_timestamp(13), 1100], [utils.get_timestamp(12), 1300], [utils.get_timestamp(11), 1250], [utils.get_timestamp(10), 1501], [utils.get_timestamp(9), 1400], [utils.get_timestamp(8), 1350], [utils.get_timestamp(7), 1390], [utils.get_timestamp(6), 1252], [utils.get_timestamp(5), 1410], [utils.get_timestamp(4), 1484], [utils.get_timestamp(3), 1410], [utils.get_timestamp(2), 1322], [utils.get_timestamp(1), 1320], [utils.get_timestamp(0), 1438]];
    
        var options = {
            xaxis : {
                mode : "time",
                tickLength : 5
            },
            series : {
                lines : {
                    show : true,
                    lineWidth : 2,
                    fill : false
                },
                shadowSize : 0
            },
            selection : {
                mode : "x"
            },
            grid : {
                hoverable : true,
                clickable : true,
                tickColor : chart_border_color,
                borderWidth : 0,
                borderColor : chart_border_color,
            },
            tooltip : true,
            tooltipOpts : {
                content : "Your sales for <b>%x</b>: <span class='value'>$%y</span>",
                dateFormat : "%y-%0m-%0d",
                defaultTheme : false,
                shifts: {
                    x: -75,
                    y: -70
                }
            },
            colors : [chart_color],
    
        };
    
        var plot = $.plot($("#sales-chart"), [d], options);


        // datatables
        $('#datatable-example').dataTable({
            "sPaginationType": "full_numbers",
            "iDisplayLength": 20,
            "aLengthMenu": [[20, 50, 100, -1], [20, 50, 100, "All"]]
        });
    };

    $(document).on("ready page:load", page_scripts);
})();