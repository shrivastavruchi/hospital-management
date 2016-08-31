class ServicesController < ApplicationController
	def new
		@visit = Visit.find(params[:visit_id])
		@service = @visit.services.build
	end

	def create
		debugger
	end	


	private
	
end

