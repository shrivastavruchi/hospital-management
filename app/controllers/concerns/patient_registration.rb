module PatientRegistration
  extend ActiveSupport::Concern
  included do
		before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
  end



  	def set_patient
      @patient = Patient.find(params[:id])
    end

    def get_country
      @countries = CS.countries.except!(:COUNTRY_ISO_CODE).collect {|p| [ p[ 1], p[0] ] }.compact
      @states = CS.states(:in).collect {|p| [ p[ 1], p[0] ] }.compact
      @cities = CS.cities(:MP)
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:patient_name, :age, :gender,address_attributes: [:city, :country,  :state, :pin_code, :patient_id, :id])
    end

end