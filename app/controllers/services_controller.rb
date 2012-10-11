class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

  def show
    @service = Service.find(params[:id])
    @statuses = @service.statuses.last(4).reverse
    # what I need:  @statuses = statuses_sorted_by_date
  end
end