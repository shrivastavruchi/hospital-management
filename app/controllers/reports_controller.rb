class ReportsController < ApplicationController

	def index
	end	

	def download_paid_bill
		start_date = params[:start_date] if params[:start_date].present?
		end_date = params[:end_date]  if params[:end_date].present?
		start_date = DateTime.strptime(start_date, "%m/%d/%Y").to_date if start_date.present?
		end_date = DateTime.strptime(end_date, "%m/%d/%Y").to_date if end_date.present?
		if params[:paid_bill] == "true"

			@visits = Visit.joins(:payment).where("payments.created_at >= ? and payments.created_at <= ? ",start_date, end_date+1.day)
		end
		if params[:paid_bill] == "false"
			visit_id = Discharge.all.map(&:visit_id)
			@visits = Visit.where(:id=>visit_id).includes(:payment).where('payments.id' => nil)
		end	
	end	

	def genrate_report
 		@visit = Visit.find(params[:visit_id])
 		@visit_service= @visit.visit_services
 		@rooms = @visit.visit_rooms
 		@prescription_details = @visit.prescription_details
	end

end 	