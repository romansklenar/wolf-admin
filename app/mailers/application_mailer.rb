class ApplicationMailer < ActionMailer::Base
  include AbstractController::Callbacks

  default from: "no-reply@#{Rails.application.secrets.domain_name}"
  default template_path: Proc.new { "mailers/#{self.class.name.underscore}" }

  layout 'mailer'
  
  protected

  def default_url_options
    { host: Rails.application.secrets.domain_name }
  end

  def default_i18n_subject(interpolations = {})
    mailer_scope = self.class.mailer_name.tr('/', '.')
    I18n.t(:subject, interpolations.merge(scope: [:mailers, mailer_scope, action_name], default: action_name.humanize))
  end
end
