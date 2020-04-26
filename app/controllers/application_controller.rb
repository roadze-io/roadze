class ApplicationController < ActionController::Base
  before_action :handle_cross_domain_flash

  private

  def handle_cross_domain_flash
    return unless params[:notice] || params[:success] || params[:error] || params[:alert]
    redirect_to request.path, notice: params[:notice], success: params[:success], error: params[:error], alert: params[:alert]
  end
end
