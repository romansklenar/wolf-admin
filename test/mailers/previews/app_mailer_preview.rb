class AppMailerPreview < ActionMailer::Preview
  def welcome_email
    AppMailer.welcome_email
  end

  def notification_email
    AppMailer.notification_email
  end

  def invoice_email
    AppMailer.invoice_email
  end

  def activation_email
    AppMailer.activation_email
  end
end
