class Users::Devise::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout 'devise'
  
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # skip :verify_authenticity_token to make sure that session doesn't get reset when the token verification fails
  skip_before_filter :verify_authenticity_token

  def all
    auth = request.env['omniauth.auth']
    identity = Identity.find_or_create_with_omniauth(auth)

    if user_signed_in?
      if identity.user == current_user
        # identity is already associated with this user
        redirect_to edit_user_registration_path, alert: "You've already linked #{identity.provider_name} account!"
      else
        # identity is not associated with the current_user so lets associate the identity
        identity.update!(user: current_user)
        redirect_to edit_user_registration_path, notice: "Successfully linked #{identity.provider_name} account!"
      end

    elsif identity.user.present?
      # identity we found had a user associated with it so let's just log them in here
      sign_in :user, identity.user
      redirect_to after_sign_in_path_for(identity.user), notice: "Successfully authenticated from #{identity.provider_name} account."

    else
      # no user associated with the identity so we need to register new user
      registered_user = User.find_or_create_with_omniauth(auth)
      identity.update!(user: registered_user)
      sign_in :user, registered_user
      redirect_to edit_user_registration_path, notice: "Please provide us details about your self."
    end
  end

  alias_method :facebook, :all
  alias_method :twitter, :all
  alias_method :google_oauth2, :all
  alias_method :linkedin, :all

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /users/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
