# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :track_ahoy_visit, except: [:new, :create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @page_title       = 'User Login'
    @page_description = 'roadze.io user login page'
    @page_keywords    = 'Roadze, Site, Login, Loadboard, Canada loadboard, Logistics, Trucking'

    ahoy.track 'User Login Page', title: @page_title
    super
  end

  # POST /resource/sign_in
  # def create
  ahoy.track 'Session Create', title: 'New user session'
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
