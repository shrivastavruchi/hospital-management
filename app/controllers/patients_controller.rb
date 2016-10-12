class PatientsController < ApplicationController
  include PatientRegistration
  
  def index
    authorize! :read, Patient
    @patients = Patient.all  
  end

  def show
    authorize! :read, Patient
    @address = @patient.address
  end


  def new
    authorize! :create, Patient
    @patient = Patient.new
    @patient.build_address
    get_country
  end
 
  def edit
    authorize! :edit, Patient
    @address = @patient.address
    get_country
  end


  def create
    authorize! :create, Patient
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to  patient_path(@patient) ,:notice=>"Registration  was sucessfully" 
    else
      get_country
      render :new 
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    authorize! :update, Patient
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :delete, Patient
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def states
   country = params[:country_id]
   @states = CS.states(country)
    respond_to do |format|
      format.js # actually means: if the client ask for js -> return file.js
    end 
  end

  def cities
    state = params[:state_id]
    @cities = CS.cities(state)
  
    respond_to do |format|
      format.js # actually means: if the client ask for js -> return file.js
    end 
  end  

end
