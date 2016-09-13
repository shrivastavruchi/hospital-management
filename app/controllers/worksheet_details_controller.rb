class WorksheetDetailsController < ApplicationController
 before_action :set_addmission,  only:[:new,:create,:index,:destroy]
 layout 'patient'

	def index
		@worksheet_details =@addmission.worksheet_details
	end	


	def new
		@work_sheet_detail =WorksheetDetail.new
	end

	def create
		@worksheet_detail = @addmission.worksheet_details.build(worksheet_params)
		if @worksheet_detail.save
			redirect_to addmission_worksheet_details_path(@addmission)
		else
			render :new	
		end	
	end

	def destroy
		@worksheet_detail =WorksheetDetail.find_by_addmission_id(params[:addmission_id])
		if @worksheet_detail.destroy
			redirect_to addmission_worksheet_details_path(@addmission)
		else
			render :index
		end	
	end	


	private

	def set_note
    @note = Note.find(params[:id])
  end

  def set_addmission
    @addmission = Addmission.find(params[:addmission_id])
  end  

  def worksheet_params
  	 params.require(:worksheet_detail).permit(:date, :time, :addmission_id,:user_id,:pulse_rate,:height,:weight)

  end	
end
