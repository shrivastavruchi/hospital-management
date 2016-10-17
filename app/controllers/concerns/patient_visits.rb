module PatientVisits
  extend ActiveSupport::Concern
  included do
    before_action :set_visit, only: [:show, :edit, :update, :destroy,:prescription_detail,:services,:basic_detail,:discharge,:discharge_visit]
    before_action :set_patient, only: [:new, :create]
    before_action :doctor_list, :only=>[:new,:opd_visit]
    layout 'patient', only: [:basic_detail,:show,:discharge]
  
  end

  def set_patient
   @patient = Patient.find(params[:patient_id])
  end 

  def set_visit
    @visit = Visit.find(params[:id])
  end  

  def doctor_list
    @doctors = User.with_role :doctor
  end  
end
