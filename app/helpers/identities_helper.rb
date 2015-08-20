module IdentitiesHelper

  def link_or_unlink_identity_link(authenticable, provider, text: nil)
    identity = authenticable.identities.find_by(provider: provider)
    text ||= provider.titleize

    if identity
      link_to "#{fa_icon(provider)} &nbsp; Unlink #{text}".html_safe, identity_path(identity), class: "btn btn-danger #{provider}", method: :delete, data: { confirm: "Are you sure?" }
    else
      link_to "#{fa_icon(provider)} &nbsp; Link with #{text}".html_safe, user_omniauth_authorize_path(provider), class: "btn btn-primary #{provider}"
    end
  end

  def authenticate_link(provider, text: "Sign in")
    link_to "#{fa_icon(provider)} &nbsp; #{text}".html_safe, user_omniauth_authorize_path(provider), class: "btn btn-primary btn-lg #{provider}"
  end

end
