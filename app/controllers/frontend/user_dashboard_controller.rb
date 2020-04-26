class Frontend::UserDashboardController < ApplicationController
  skip_before_action :track_ahoy_visit
  before_action :authenticate_user!

  def index
    @page_title       = 'User Dashboard'
  end

end
