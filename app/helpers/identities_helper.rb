module IdentitiesHelper

  def link_or_unlink_identity_link(authenticable, provider)
    identity = authenticable.identities.find_by(provider: provider)

    if identity
      link_to "Unlink #{provider.titleize} account", identity_path(identity), class: "btn btn-danger #{provider}", method: :delete, data: { confirm: "Are you sure?" }
    else
      link_to "Link with #{provider.titleize} account", user_omniauth_authorize_path(provider), class: "btn btn-primary #{provider}"
    end
  end

  def authenticate_link(provider, text: "Sign in")
    link_to "#{fa_icon(provider)} &nbsp; #{text} via #{provider.titleize}".html_safe, user_omniauth_authorize_path(provider), class: "btn btn-primary btn-lg #{provider}"
  end

end
