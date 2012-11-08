class Admin::AdminsController < ApplicationController
  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to admin_dashboard_path, notice: 'New Admin created.'
    else
      render :new, alert: 'New Admin not created.'
    end
  end

  def edit
  end

  def destroy
  end
end
