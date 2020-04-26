class Backend::AccountsController < ApplicationController
  skip_before_action :track_ahoy_visit
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def set_account
    @account = Account.friendly.find(params[:id])
  end
end