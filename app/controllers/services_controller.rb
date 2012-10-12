class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

  def show
    @service = Service.find(params[:id])
    @statuses = @service.statuses.order('created_at ASC').last(4).reverse
  end
end