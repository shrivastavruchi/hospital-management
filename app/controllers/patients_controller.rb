class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    authorize! :read, Patient
    @patients = Patient.all  
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    authorize! :read, Patient
    @address = @patient.address
  end

  # GET /patients/new
  def new
    #
    authorize! :create, Patient
    @patient = Patient.new
    @patient.build_address
  end

  # GET /patients/1/edit
  def edit
    authorize! :edit, Patient
    @address = @patient.address
  end

  # POST /patients
  # POST /patients.json
  def create
    authorize! :create, Patient
    @patient = Patient.new(patient_params)
    if @patient.save
      @address = @patient.build_address(patient_params[:address_attributes])
      @address.save
      redirect_to  patient_path(@patient) ,:notice=>"Registration  was sucessfully" 
    else
      render :new 
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    authorize! :update, Patient
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    authorize! :delete, Patient
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:patient_name, :age, :gender,address_attributes: [:city, :country, :pin_code, :patient_id, :id])
    end
end
