class ServicesController < ApplicationController
	before_action :find_service,:only=>[:destroy,:edit,:update]

	
	def index
		@services = Service.all
	end	
		
	def new
 		@service = Service.new
	end	

	def create
		@service = Service.new(service_params)
		if @service.save
			redirect_to services_path ,:notice=>"service created "
		else
			render :new
		end	
	end	

	def edit
	end	

	def update
		if @service.update(service_params)
			redirect_to services_path,:notice=>"service updated"
		else
			render :edit
		end	
	end		

	def destroy
		@service.delete
		@services = Service.all
	end	

	private

		def service_params 
			 params.require(:service).permit(:id,:service_name,:charges)
		end	

		def find_service
			@service = Service.find(params[:id])
		end	
end

