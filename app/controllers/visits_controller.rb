class VisitsController < ApplicationController
  before_action :set_patient 
  before_action :set_visit, only: [:show, :edit, :update, :destroy]
  # GET /visits
  # GET /visits.json
  def index
    authorize! :read, Visit
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @basic_detail = @visit.basic_detail
  end

  # GET /visits/new
  def new
    authorize! :new, Visit
    @visit = Visit.new
    @visit.build_basic_detail
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    authorize! :create, Visit
    @visit = @patient.visits.build(visit_params)
      if @visit.save
        @basic_details  = @visit.build_basic_detail(visit_params[:basic_detail_attributes])
        @basic_details.save
        redirect_to patient_visit_path(@patient,@visit), notice: 'Visit was successfully created.'
      else
        render :new 
      end  
    end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    authorize! :update, Visit
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    authorize! :delete, Visit
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:patient_id, :doctor_id, :date,basic_detail_attributes: [:blood_group, :boold_presure, :patient_id, :visit_id, :weight, :patient_history,:examination_details,:diagnosis, :id])
    end
end
