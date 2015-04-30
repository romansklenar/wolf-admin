class UserDecorator < ApplicationDecorator
  IP_LOCATOR_URL = "http://whois.domaintools.com"

  delegate_all

  def email
    mail_to object.email if object.email.present?
  end

  def current_sign_in_ip
    link_to object.current_sign_in_ip, "#{IP_LOCATOR_URL}/#{object.current_sign_in_ip}", target: '_blank' if object.current_sign_in_ip.present?
  end

  def last_sign_in_ip
    link_to object.last_sign_in_ip, "#{IP_LOCATOR_URL}/#{object.last_sign_in_ip}", target: '_blank' if object.last_sign_in_ip.present?
  end
end
