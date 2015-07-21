(function () {
    var page_scripts = function () {
        if (!$("#reports-alt").length) return;

		// daterange input
		$('input[name="daterange"]').daterangepicker({
			ranges: {
			 	'Today': [moment(), moment()],
			 	'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
			 	'Last 7 Days': [moment().subtract('days', 6), moment()],
			 	'This Month': [moment().startOf('month'), moment().endOf('month')],
			 	'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
			},
			opens: "left",
			startDate: moment().subtract('days', 29),
			endDate: moment()
		});


		// Datatable
        var $table = $("#datatable-example");

        $table.dataTable({
            "sPaginationType": "full_numbers",
            "iDisplayLength": 20,
			"aLengthMenu": [[20, 50, 100, -1], [20, 50, 100, "All"]],
			bDestroy: true
        });

        

		// bar chart
        var $chrt_border_color = "#efefef";
		var $chrt_second = "#4fa3d5";

		var dBar = [["Jan", 2300.33], ["Feb", 1899.99], ["March", 8830.00], ["April", 1778.00], ["May", 4298.00], ["Jun", 2298.00], ["Jul", 4298.00], ["Aug", 1798.00], ["Sep", 6139.99], ["Oct", 834.00], ["Nov", 1855.99], ["Dec", 3433.99]];

		var options = {
			yaxes: {
		        min: 0
		    },
			xaxis : {
				mode: "categories",
				tickLength: 0,
				ticks: [[0, "January"], [1, "February"],[2, "March"],[3, "April"],[4, "May"],[5, "June"], [6, "July"],[7, "August"],[8, "September"], [9, "October"], [10, "November"], [11, "December"]],
			},
			series : {
				bars : {
					show : true,
					lineWidth: 0,
					barWidth: 0.55,
					align: 'center',
					fillColor : {
						colors : [{ opacity : 1 }, { opacity : 1 }]
					}
				}
			},
			grid : {
				show: true,
				hoverable : true,
				clickable : true,
				tickColor : $chrt_border_color,
				borderWidth : 0,
				borderColor : $chrt_border_color,
			},
			tooltip : true,
			tooltipOpts : {
				content: function (a, b, c, d) {
					return "Sales on <b>" + b + "</b> 2014: <span class='value'>$" + c.formatMoney(2) + "</span>";
				},
				defaultTheme : false,
				shifts: {
					x: -65,
					y: -70
				}
			},
			colors : [$chrt_second],
		};

		var plot = $.plot($("#bar-chart"), [dBar], options);
	};

	$(document).on("ready page:load", page_scripts);
})();