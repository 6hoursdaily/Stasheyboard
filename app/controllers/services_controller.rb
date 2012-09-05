class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

  def show
    @services = Service.all
    @service = Service.find_by_id(params[:id])
  end
end