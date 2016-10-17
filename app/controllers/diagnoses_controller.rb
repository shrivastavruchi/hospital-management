class DiagnosesController < ApplicationController
  before_action :set_diagnosis, only: [:show, :edit, :update, :destroy]
  before_action :set_visit,only: [:new, :create, :index,:destroy]
  #before_action :set_addmission,only: [:new,:create,:index,:destroy]
  layout 'patient'

  # GET /diagnoses
  # GET /diagnoses.json
  def index
    @diagnoses = @visit.diagnoses
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.json
  def show
  end

  # GET /diagnoses/new
  def new
    @diagnosis = Diagnosis.new
  end

  # GET /diagnoses/1/edit
  def edit
  end

  # POST /diagnoses
  # POST /diagnoses.json
  def create
    @diagnosis = @visit.diagnoses.build(diagnosis_params)

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to   visit_diagnoses_path(@visit), notice: 'Diagnosis was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /diagnoses/1
  # PATCH/PUT /diagnoses/1.json
  def update
    respond_to do |format|
      if @diagnosis.update(diagnosis_params)
        format.html { redirect_to @diagnosis, notice: 'Diagnosis was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnosis }
      else
        format.html { render :edit }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.json
  def destroy
    @diagnosis = Diagnosis.find_by_visit_id(params[:visit_id])
    if @diagnosis.destroy
      redirect_to  visit_diagnoses_path(@visit), notice: 'Diagnosis was successfully destroyed.' 
    else
      render :index

    end
  end

  def print_receipt
    @visit = Visit.find(params[:visit_id])
    @diagnosis  = @visit.diagnoses
    @presecription_details = @visit.prescription_details
    @visit_services = @visit.visit_services
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis
      @diagnosis = Diagnosis.find(params[:id])
    end

    # def set_addmission
    #   @addmission = Addmission.find(params[:addmission_id])
    # end  

    def set_visit

      @visit = Visit.find(params[:visit_id])
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnosis_params
      params.require(:diagnosis).permit(:name,:addmission_id)
    end
end
