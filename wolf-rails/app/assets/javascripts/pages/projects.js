(function () {
	var page_scripts = function () {
		if (!$("#projects").length) return;

		var $projects = $(".project");

		$projects.each(function (index, el) {
			var $btn = $(el).find(".add-more");
			var $menu = $btn.siblings(".menu");
			var timeout;

			$btn.click(function (e) { e.preventDefault(); });

			$(el).on("mouseenter", ".add-more, .menu", function () {
				clearTimeout(timeout);
				timeout = null;
				$menu.addClass("active");
			});

			$(el).on("mouseleave", ".add-more, .menu", function () {
				timeout = setTimeout(function () {
					$menu.removeClass("active");
				}, 400);
			});
		});
	};

	$(document).on("ready page:load", page_scripts);
})();