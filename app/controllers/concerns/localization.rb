module Localization
  extend ActiveSupport::Concern

  included do
    around_action :set_locale, :set_time_zone
    helper_method :browser_locale, :browser_time_zone

    def set_locale
      locale = case
        when user_signed_in? && current_user.locale.presence then current_user.locale
        else # browser_locale
      end

      Rails.application.config.i18n.locale = I18n.locale = locale if locale
      yield # we need to call yield because around filter callback is used
    end

    def set_time_zone
      time_zone = case
        when user_signed_in? && current_user.time_zone.presence then current_user.time_zone
        else browser_time_zone || 'UTC'
      end

      Rails.application.config.time_zone = Time.zone if time_zone
      yield # we need to call yield because around filter callback is used
    end

    def browser_locale
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.presence
    end

    def browser_time_zone
      ActiveSupport::TimeZone::MAPPING.invert.fetch(cookies['browser.time_zone'].presence, nil)
    end
  end

end
