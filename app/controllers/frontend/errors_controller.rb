class Frontend::ErrorsController < ApplicationController
  skip_before_action :track_ahoy_visit
  
  def not_found
    render status: 404
  end

  def unacceptable
    render status: 422
  end

  def internal_server_error
    render status: 500
  end
  
end