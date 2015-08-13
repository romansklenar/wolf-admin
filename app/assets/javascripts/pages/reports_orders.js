(function () {
  var get_timestamp = function (less_days) {
    return moment().subtract('days', less_days).toDate().getTime();
  }
  
  var page_scripts = function () {
    if (!$("#reports").length) return;
    
    var chart_border_color = "#efefef";
    var chart_color = "#b0b3e3";

    /* sales chart */
  
    var d = [[get_timestamp(18), 1245], [get_timestamp(17), 1290], [get_timestamp(16), 1230], [get_timestamp(15), 1290], [get_timestamp(14), 1250], [get_timestamp(13), 1100], [get_timestamp(12), 1300], [get_timestamp(11), 1250], [get_timestamp(10), 1501], [get_timestamp(9), 1400], [get_timestamp(8), 1350], [get_timestamp(7), 1390], [get_timestamp(6), 1252], [get_timestamp(5), 1410], [get_timestamp(4), 1484], [get_timestamp(3), 1410], [get_timestamp(2), 1322], [get_timestamp(1), 1320], [get_timestamp(0), 1438]];
  
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
