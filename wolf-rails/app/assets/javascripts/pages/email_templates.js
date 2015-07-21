(function () {
    var page_scripts = function () {
        if (!$("#email-templates").length) return;

		Zoomerang
            .config({
                maxHeight: 650,
                maxWidth: 650,
                bgColor: '#000',
                bgOpacity: .8
            })
            .listen('.email img');

        $(".fa-search-plus").click(function () {
        	var $el = $(this).siblings("img");
        	Zoomerang.open($el[0]);
        });
    };

    $(document).on("ready page:load", page_scripts);
})();