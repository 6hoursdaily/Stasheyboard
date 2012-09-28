class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

  def show
    @service = Service.find(params[:id])
    @statuses = @service.statuses.last(4).reverse
  end
end