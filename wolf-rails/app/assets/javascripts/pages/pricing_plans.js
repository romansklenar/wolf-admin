(function () {
	var page_scripts = function () {
		if (!$("#pricing").length) return;

		var $plans = $(".plans .plan");
		$plans.click(function () {
			$plans.removeClass("selected");
			$(this).addClass("selected");
		});

		var $step_triggers = $("[data-step]");
		var $step_panels = $(".step-panel");
		var $tabs = $(".steps .step");

		$step_triggers.click(function (e) {
			e.preventDefault();
			var go_to_step = $(this).data("step");
			
			$step_panels.removeClass("active");
			$step_panels.eq(go_to_step).addClass("active");

			$tabs.removeClass("active");
			$tabs.eq(go_to_step).addClass("active");

			if (go_to_step === 1) {
				$("#billing-form input:text:eq(0)").focus();
			}
		});
	};

	$(document).on("ready page:load", page_scripts);
})();