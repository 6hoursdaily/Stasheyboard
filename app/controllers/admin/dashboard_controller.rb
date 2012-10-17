class Admin::DashboardController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @services = Service.all
  end

  private

  def authorize_admin!
    unless authenticate_admin!
      flash.now[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
end