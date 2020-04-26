class Backend::AdminDashboardController < ApplicationController
  skip_before_action :track_ahoy_visit
  before_action :authenticate_admin!
  def index
  end
end
