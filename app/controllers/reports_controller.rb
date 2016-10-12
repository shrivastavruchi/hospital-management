class ReportsController < ApplicationController

	def genrate_report
 		@visit = Visit.find(params[:visit_id])
 		@visit_service= @visit.visit_services
 		@rooms = @visit.visit_rooms
 		@prescription_details = @visit.prescription_details
	end

end 	