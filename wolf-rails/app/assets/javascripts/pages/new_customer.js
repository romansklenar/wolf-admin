(function () {
	var page_scripts = function () {
		if (!$("#form").length) return;

		// form validation
		$('#new-customer').validate({
			rules: {
				"customer[first_name]": {
					required: true
				},
				"customer[email]": {
					required: true,
					email: true
				},
				"customer[address]": {
					required: true
				},
				"customer[notes]": {
					required: true
				}
			},
			highlight: function (element) {
				$(element).closest('.form-group').removeClass('success').addClass('error');
			},
			success: function (element) {
				element.addClass('valid').closest('.form-group').removeClass('error').addClass('success');
			}
		});

		// tags with select2
		$("#customer-tags").select2({
			placeholder: 'Select tags or add new ones',
			tags:["supplier", "lead", "client", "friend", "developer", "customer"],
			tokenSeparators: [",", " "]
		});

		// masked input example using phone input
		$(".mask-phone").mask("(999) 999-9999");
		$(".mask-cc").mask("9999 9999 9999 9999");
	};

	$(document).on("ready page:load", page_scripts);
})();