class ApplicationController < ActionController::Base
  set_current_tenant_through_filter # Required to opt into this behavior
  before_action :set_account_as_tenant
  before_action :handle_cross_domain_flash

  private

  def handle_cross_domain_flash
    return unless params[:notice] || params[:success] || params[:error] || params[:alert]

    redirect_to request.path, notice: params[:notice], success: params[:success], error: params[:error], alert: params[:alert]
  end

  def set_account_as_tenant
    return unless user_signed_in?

    account = Account.find_by(id: current_user.account_id)
    set_current_tenant(account)
  end

end
