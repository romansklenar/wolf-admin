class ErrorsController < ApplicationController
  layout 'error'

  skip_before_action :authenticate_user! if defined?(Devise)
  skip_authorize_resource if defined?(CanCan)
  before_action :set_error

  def error_404
    @not_found_path = request.original_fullpath

    respond_to do |format|
      format.html { render :error_404, status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def error_422
    respond_to do |format|
      format.html { render :error_422, status: 422 }
      format.all  { render nothing: true, status: 422 }
    end
  end

  def error_500
    respond_to do |format|
      format.html { render :error_500, status: 500 }
      format.all  { render nothing: true, status: 500 }
    end
  end

  private

    def set_error
      @error = request.env['action_dispatch.exception']
    end
end
