(function () {
	var page_scripts = function () {
		if (!$("#ui").length) return;

		set_up_offline_plugin();

		// Focus input when prompt modal is shown
		$('#prompt-modal').on('shown.bs.modal', function (e) {
			$("#prompt-modal").find("input:text").focus();
		})

		// Focus first input when form modal is shown
		$('#form-modal').on('shown.bs.modal', function (e) {
			$("#form-modal").find("input:text:eq(0)").focus();

			// initialize datepicker when the modal is shown, does not work if the input is hidden
			$("#form-modal .datepicker").datepicker({
	        	autoclose: true
	        });
		})

		// Show message on submit
		$("#form-modal").submit(function () {
			$(this).modal('hide');
			Messenger().post("Your task was created succesfully.");
			return false;
		});


		// Focus first input when form modal is shown
		$('#form-validation-modal').on('shown.bs.modal', function (e) {
			$("#form-validation-modal").find("input:text:eq(0)").focus();
		})

		// Form validation
		$('#new-user-form').validate({
			rules: {
				"user[name]": {
					required: true
				},
				"user[email]": {
					required: true,
					email: true
				},
				"user[notes]": {
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


		// Notifications

		Messenger.options = {
			extraClasses: 'messenger-fixed messenger-on-bottom messenger-on-right',
		    theme: 'flat'
		}

		$(".normal-notification").click(function (e) {
			e.preventDefault();
			Messenger().post("A new order has been placed by John Williams!");
		});

		$(".error-notification").click(function (e) {
			e.preventDefault();

			Messenger().post({
			  	message: 'Sorry, there was problem while processing your request.',
			  	type: 'error',
			  	showCloseButton: true
			});
		});

		$(".button-notification").click(function (e) {
			e.preventDefault();

			var msg;
			msg = Messenger().post({
			  	message: 'Uploading new files...',
			  	type: 'info',
			  	actions: {
			    	cancel: {
			      		label: 'cancel upload',
			      		action: function() {
			        		return msg.update({
			          			message: 'File uploading was canceled',
			          			type: 'success',
			          			actions: false
			        		});
			      		}
			    	}
				}
			});
		});

		$(".run-notification").click(function (e) {
			e.preventDefault();

			var i = 0;
			Messenger().run({
			  	errorMessage: 'Error sending message',
			  	successMessage: 'Message sent!',
			  	action: function(opts) {
			    	if (++i < 2) {
			      		return opts.error({
			        		status: 500,
			        		readyState: 0,
			        		responseText: 0
			      		});
			    	} else {
			      		return opts.success();
			    	}
			  	}
			});
		});


		// Guided Tour in app with shepherd.js
		var tour;

		tour = new Shepherd.Tour({
		  	defaults: {
				classes: 'shepherd-element shepherd-open shepherd-theme-arrows',
				showCancelLink: true
		    }
		});

		tour.addStep('example-step', {
		  	text: 'This modal looks really cool for welcoming new users',
		  	attachTo: {
		  		element: '.tour-first-step',
		  		on: 'bottom'
		  	},
		  	buttons: [
		  	{
		      	text: 'Exit',
		      	classes: 'btn btn-default',
		    	action: tour.cancel
		    },
		    {
		    	text: 'Next',
		    	classes: 'btn btn-primary',
		      	action: tour.next
		    }]
		});

		tour.addStep('example-step', {
		  	text: 'This button is useful to show users a message regarding an action on your app',
		  	attachTo: {
		  		element: '.tour-second-step',
		  		on: 'top'
		  	},
		  	buttons: [
		  	{
		      	text: 'Back',
		      	classes: 'btn btn-default',
		    	action: tour.back
		    },
		    {
		    	text: 'Next',
		    	classes: 'btn btn-primary',
		      	action: tour.next
		    }]
		});

		tour.addStep('example-step', {
		  	text: 'This plugin is very useful to notify users of their connections',
		  	attachTo: {
		  		element: '.tour-third-step',
		  		on: 'top'
		  	},
		  	buttons: [
		  	{
		      	text: 'Back',
		      	classes: 'btn btn-default',
		    	action: tour.back
		    },
		    {
		    	text: 'Next',
		    	classes: 'btn btn-primary',
		      	action: tour.next
		    }]
		});

		tour.addStep('example-step', {
		  	text: 'You can change the theme skins here',
		  	attachTo: {
		  		element: '.skin-switcher',
		  		on: 'left'
		  	},
		  	buttons: [
		  	{
		      	text: 'Back',
		      	classes: 'btn btn-default',
		    	action: tour.back
		    },
		    {
		    	text: 'Done',
		    	classes: 'btn btn-success',
		      	action: tour.next
		    }]
		});

		$(".start-tour").click(function (e) {
			e.preventDefault();
			tour.start();
		});
	};

	$(document).on("ready page:load", page_scripts);


	var set_up_offline_plugin = function () {
		// This is an internal script that allows you to test the Offline.js plugin and see how your pages respond to 
		// different connectivity states without having to use brute-force methods to disable your actual connectivity.

		// Only used for demonstration purposes, make sure to remove this in production.
		var a, b;
		if ("undefined" == typeof Offline || null === Offline) throw new Error("Offline simulate UI brought in without Offline.js");
		console.info("The offline.simulate.ui.js module is a development-only resource. Make sure to remove offline.simulate.ui.js in production."), 
		Offline.options.reconnect = {
		    initialDelay: 10
		}, 
		a = function () {
		    var a;
		    return document.getElementById("offline-simulate-check").addEventListener("click", function () {
				var a;
		        return null == (a = Offline.options).checks && (a.checks = {}), Offline.options.checks.active = this.checked ? "down" : "up", Offline.check()
			})
		}, 
		"interactive" === (b = document.readyState) || "complete" === b ? a() : document.addEventListener("DOMContentLoaded", a)
	}
})();