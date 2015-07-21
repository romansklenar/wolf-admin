class AppMailer < ActionMailer::Base
	default from: "<from_address>"
  	
  	def welcome_email
  		mail to: "<to_address>", subject: "Welcome!"
  	end

  	def notification_email
  		mail to: "<to_address>", subject: "Notification!"
  	end

  	def invoice_email
  		mail to: "<to_address>", subject: "Invoice!"
  	end

  	def activation_email
  		mail to: "<to_address>", subject: "Activation!"
  	end
end

