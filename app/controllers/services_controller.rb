class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

  def show
    @service = Service.find(params[:id])
    @statuses = @service.statuses.order('created_at ASC').last(4).reverse
  end

  def feed
    @title = "Service Status update feed"
    @service = Service.find(params[:id], :include => :statuses)
    @statuses = @service.statuses.order('created_at DSC').last(4)
    respond_to do |format|
      format.atom { render :layout => false }
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params[:service])
    if @service.save
      redirect_to admin_dashboard_path, notice: "Server has been created.  Its current status is '#{@service.statuses.last.name}'."
    else
      render :new, alert: 'Server was not created.'
    end
  end
end