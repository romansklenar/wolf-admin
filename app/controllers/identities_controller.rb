class IdentitiesController < ApplicationController
  before_action :set_identity

  def destroy
    @identity.destroy
    redirect_to edit_user_registration_path, notice: "Successfully unlinked #{@identity.provider_name} account."
  end

  private

    def set_identity
      @identity = Identity.find(params[:id])
    end
end
