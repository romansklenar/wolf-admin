class DeviseMailer < ApplicationMailer
  include Devise::Mailers::Helpers

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end
  
  protected

  # NOTE: override Devise::Mailers::Helpers method to look templates in another directory
  def template_paths
    template_path = _prefixes.dup
    template_path.unshift "devise/mailer"
    template_path.unshift "#{@devise_mapping.scoped_path}/mailer" if self.class.scoped_views?
    template_path
  end
end
