class ServicesController < ApplicationController
	before_action :set_visits ,:only=>[:new,:create]
	
	def new
		@service = Service.new
	end	
	
	def create
	end	

	private

		def set_visits
			@visit = Visit.find(params[:visit_id])
		end

end

