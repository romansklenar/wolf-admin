(function () {
	var page_scripts = function () {
		if (!$("#search").length) return;

		var $filters = $(".filters .filter input:checkbox");
		
		$filters.change(function () {
			var $option = $(this).closest(".filter").find(".filter-option");

			if ($(this).is(":checked")) {
				$option.slideDown(150, function () {
					$option.find("input:text:eq(0)").focus();
				});
			} else {
				$option.slideUp(150);
			}
		});

		// Filter dropdown options for Created date, show/hide datepicker or input text
		var $dropdown_switcher = $(".field-switch");
		$dropdown_switcher.change(function () {
			var field_class = $(this).find("option:selected").data("field");
			var $filter_option = $(this).closest(".filter-option");
			$filter_option.find(".field").hide();
			$filter_option.find(".field." + field_class).show();

			if (field_class === "calendar") {
				$filter_option.find(".datepicker").datepicker("show");
			} else {
				$filter_option.find(".field." + field_class + " input:text").focus();
			}
		});

		// Datepicker
	    $('.datepicker').datepicker({
	    	autoclose: true
	    	, orientation: 'right top'
	    	// , endDate: new Date()
	    });


	    // Datatable
	    var $table = $("#products-datatable");

        $table.dataTable({
	        "sPaginationType": "full_numbers",
	        "iDisplayLength": 20,
			"aLengthMenu": [[20, 50, 100, -1], [20, 50, 100, "All"]],
			bDestroy: true
	    });


	    // Bulk actions checkboxes

		var $toggle_all = $("input:checkbox.toggle-all");
		var $checkboxes = $("[name='select-product']");
		var $bulk_actions_btn = $(".bulk-actions .dropdown-toggle");

		$toggle_all.change(function () {
			var checked = $toggle_all.is(":checked");
			if (checked) {
				$checkboxes.prop("checked", "checked");
				toggleBulkActions(true);
			} else {
				$checkboxes.prop("checked", "");
				toggleBulkActions(false);
			}
		});

		$checkboxes.change(function () {
			var anyChecked = $("[name='select-product']:checked");
			toggleBulkActions(anyChecked.length);
		});

		function toggleBulkActions(show) {
			if (show) {
				$bulk_actions_btn.removeClass("disabled");
			} else {
				$bulk_actions_btn.addClass("disabled");	
			}
		}
	};

	$(document).on("ready page:load", page_scripts);
})();