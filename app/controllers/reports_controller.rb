class ReportsController < ApplicationController

	def paid_bill
		@visit = Visit.find(params[:visit_id])
    @services = Service.where("visit_id=? and paid=?", params[:visit_id], "true")
	end	
end
