class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

  def show
    @services = Service.all
  end
end