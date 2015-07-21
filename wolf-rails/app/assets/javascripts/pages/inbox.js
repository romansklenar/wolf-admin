(function () {
    var page_scripts = function () {
        if (!$("body#sidebar").length) return;
        
        $("html, body").css('height', '100%');
		$(".main-sidebar").wrapInner("<div class='scroll-wrapper'></div>");
    };

    $(document).on("ready page:load", page_scripts);
})();