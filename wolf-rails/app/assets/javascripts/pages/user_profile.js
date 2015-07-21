(function () {
	var page_scripts = function () {
		if (!$("#user-profile").length) return;

		// tabs
    	var $tabs = $(".tabs a");
    	var $tab_contents = $(".tab-content .tab");

    	$tabs.click(function (e) {
    		e.preventDefault();
    		var index = $tabs.index(this);

    		$tabs.removeClass("active");
    		$tabs.eq(index).addClass("active");

    		$tab_contents.removeClass("active");
    		$tab_contents.eq(index).addClass("active");
    	});


    	// orders datatable 
        $('#datatable-example').dataTable({
            "sPaginationType": "full_numbers",
            "iDisplayLength": 20,
			"aLengthMenu": [[20, 50, 100, -1], [20, 50, 100, "All"]]
        });
	}

	$(document).on("ready page:load", page_scripts);
})();