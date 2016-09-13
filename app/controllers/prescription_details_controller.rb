class PrescriptionDetailsController < ApplicationController
	before_action :set_addmission,  only:[:new,:create,:index,:destroy]
	layout 'patient'

	def index
		@prescription_details = @addmission.prescription_details
	end	


	def new
		@prescription_detail = PrescriptionDetail.new
	end

	def create
		@prescription_detail = @addmission.prescription_details.build(prescription_detail_params)
		if @prescription_detail.save
			redirect_to  addmission_prescription_details_path(@addmission)
		else
			render :new	
		end	
	end

	def destroy
		@prescription_detail =PrescriptionDetail.find_by_addmission_id(params[:addmission_id])
		if @prescription_detail.destroy
			redirect_to  addmission_prescription_details_path(@addmission)
		else
			render :index
		end	
	end	


	private

	def set_prescription_detail
    @prescription_detail = PrescriptionDetail.find(params[:id])
  end

  def set_addmission
    @addmission = Addmission.find(params[:addmission_id])
  end  

  def prescription_detail_params
  	params.require(:prescription_detail).permit(:addmission_id,:drug_name,:description,:schedule,:quantity)
	end	

end
