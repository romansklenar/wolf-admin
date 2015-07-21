(function () {
	var page_scripts = function () {
		if (!$("#wizard").length) return;

		var $steps = $(".form-wizard .step"),
			$buttons = $steps.find("[data-step]"),
			$tabs = $(".header .steps .step"),
			active_step = 0;

		$buttons.click(function (e) {
			e.preventDefault();

			var step_index = $(this).data("step") - 1;
			var in_fade_class = (step_index > active_step) ? "fadeInRightStep" : "fadeInLeftStep";
			var out_fade_class = (in_fade_class === "fadeInRightStep") ? "fadeOutLeftStep" : "fadeOutRightStep";

			var $out_step = $steps.eq(active_step);
			$out_step.on(utils.animation_ends(), function () {
				$out_step.removeClass("fadeInRightStep fadeInLeftStep fadeOutRightStep fadeOutLeftStep");
			}).addClass(out_fade_class);

			active_step = step_index;

			$tabs.removeClass("active").filter(":lt(" + (active_step + 1) + ")").addClass("active");

			$steps.removeClass("active");
			$steps.eq(step_index).addClass("active animated " + in_fade_class);
		});
	};

	$(document).on("ready page:load", page_scripts);
})();