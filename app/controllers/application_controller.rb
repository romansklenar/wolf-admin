class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to backlink, alert: exception.message }
      format.js   { render partial: 'shared/access_denied', locals: { exception: exception } }
      format.json { render json: { error: exception.message }, status: 403 }
    end
  end if defined?(CanCan)
  
  before_action :set_user_locale
  before_action :set_user_time_zone

  protected

  def set_user_locale
    if user_signed_in? && current_user.locale.presence
      Rails.application.config.i18n.locale = I18n.locale = current_user.locale
    end
  end
  
  def set_user_time_zone
    if user_signed_in? && current_user.time_zone.presence
      Rails.application.config.time_zone = Time.zone = current_user.time_zone
    end
  end

  def backlink
    user_signed_in? ? after_sign_in_path_for(current_user) : (request.referer || root_path)
  end
end
