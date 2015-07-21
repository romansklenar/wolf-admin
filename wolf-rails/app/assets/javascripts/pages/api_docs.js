(function () {
	var page_scripts = function () {
		if (!$("#docs").length) return;
		
		hljs.configure({
		  tabReplace: '  ',
		  classPrefix: ''
		})
		hljs.initHighlightingOnLoad();


		// language toggle
		var $languages = $(".languages .language");
		$languages.click(function (e) {
			e.preventDefault();
			var lang = $(this).data("lang");
			$languages.removeClass("selected");
			$(this).addClass("selected");

			$("pre code").hide();
			$("pre code." + lang).css("display", "block");
		});
	};

	$(document).on("ready page:load", page_scripts);

	// Make highlighting work with turbolinks
	$(document).on('page:change page:restore', function () {
	  $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
	});
})();