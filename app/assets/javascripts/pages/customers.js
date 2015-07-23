(function () {
	var page_scripts = function () {
		if (!$("#users").length) return;

		// User list checkboxes
		var $allUsers = $(".select-users input:checkbox");
		var $checkboxes = $("[name='select-user']");

		$allUsers.change(function () {
			var checked = $allUsers.is(":checked");
			if (checked) {
				$checkboxes.prop("checked", "checked");
				toggleBulkActions(checked, $checkboxes.length);
			} else {
				$checkboxes.prop("checked", "");
				toggleBulkActions(checked, 0);
			}
		});

		$checkboxes.change(function () {
			var anyChecked = $(".user [name='select-user']:checked");
			toggleBulkActions(anyChecked.length, anyChecked.length);
		});

		function toggleBulkActions(shouldShow, checkedCount) {
			if (shouldShow) {
				$(".users-list .header").hide();
				$(".users-list .header.select-users").addClass("active").find(".total-checked").html("(" + checkedCount + " total users)");

			} else {
				$(".users-list .header").show();
				$(".users-list .header.select-users").removeClass("active");
			}
		}

		// Grid switcher
		$btns = $(".grid-view");
		$views = $(".users-view");

		$btns.click(function (e) {
			e.preventDefault();
			$btns.removeClass("active");
			$(this).addClass("active");
			
			$views.removeClass("active");
			
			$(".users-grid").hide();
			$(".users-list").hide();

			$($(this).data("grid")).show();
		});
	};

	$(document).on("ready page:load", page_scripts);
})();
