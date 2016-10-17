class VisitServicesController < ApplicationController
	before_action :set_visits,:only=>[:new,:create,:destroy]
	layout 'patient'

	def index
		@visit = Visit.find(params[:visit_id])
		@visit_services = @visit.visit_services
	end	

	def new
		@visit_service  = VisitService.new
		@item = params[:add_item] 
	end	

	def create
		@visit_service = @visit.visit_services.build(params_visit_service)
		if @visit_service.save
			if params[:add_item].present?
				redirect_to billing_path ,:notice=>'service was added succefully'	
			else
				redirect_to visit_visit_services_path(@visit)
			end
		else
			render :new
		end	
	end	

	def destroy
		@visit_service = VisitService.find_by_visit_id(params[:visit_id])
		if @visit_service.destroy
			redirect_to visit_visit_services_path(@visit)
		end	
	end	
		

	private
		def params_visit_service
			params.require(:visit_service).permit(:service_id,:visit_id,:quantity)
		end	

		def set_visits
			@visit = Visit.find(params[:visit_id])
		end	
end
