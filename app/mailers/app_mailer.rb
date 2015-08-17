class AppMailer < ActionMailer::Base
  default from: "<from_address>"
  default template_path: Proc.new { "pages/#{self.class.name.underscore}" }

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
