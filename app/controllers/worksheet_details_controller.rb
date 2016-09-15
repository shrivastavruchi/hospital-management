class WorksheetDetailsController < ApplicationController
 before_action :set_visit,  only:[:new,:create,:index,:destroy]
 layout 'patient'

	def index
		@worksheet_details =@visit.worksheet_details
	end	


	def new
		@work_sheet_detail =WorksheetDetail.new
	end

	def create
		@worksheet_detail = @visit.worksheet_details.build(worksheet_params)
		if @worksheet_detail.save
			redirect_to  visit_worksheet_details_path(@visit)
		else
			render :new	
		end	
	end

	def destroy
		@worksheet_detail =WorksheetDetail.find_by_visit_id(params[:visit_id])
		if @worksheet_detail.destroy
			redirect_to visit_worksheet_details_path(@visit)
		else
			render :index
		end	
	end	


	private

  def set_visit
  	@visit = Visit.find(params[:visit_id])
  end	

  def worksheet_params
  	 params.require(:worksheet_detail).permit(:date, :time, :addmission_id,:user_id,:pulse_rate,:height,:weight,:visit_id,:blood_presure)
	end	
end
