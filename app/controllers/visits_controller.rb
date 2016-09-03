class VisitsController < ApplicationController
  before_action :set_appointment ,only: [:new ,:create] 
  before_action :set_visit, only: [:show, :edit, :update, :destroy,:prescription_detail,:services]
  # GET /visits
  # GET /visits.json
  def index
    authorize! :read, Visit
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    authorize! :read, Visit
    @basic_detail = @visit.basic_detail
  end

  # GET /visits/new
  def new
    authorize! :new, Visit
    @visit = Visit.new
    @doctors = User.with_role :doctor
    @visit.build_basic_detail
    @visit.prescription_details.build
  end

  # GET /visits/1/edit
  def edit
    authorize! :edit, Visit
  end

  # POST /visits
  # POST /visits.json
  def create
    authorize! :create, Visit
    @appointment = Appointment.find(params[:appointment_id])
      unless @appointment.visit.present?
        @visit =  @appointment.build_visit(visit_params)
          if @visit.save
            redirect_to opd_visits_path, notice: 'Visit was successfully created.'
          else
            render :new 
          end 
      end
    end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    authorize! :update, Visit
      if @visit.update(visit_params)
        redirect_to opd_visits_path, notice: 'Visit was successfully updated.' 
      else
        render :services
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

  def prescription_detail
    authorize! :read, Visit
    @prescription_details = @visit.prescription_details
  end  

  def opd_visit
    authorize! :read, Visit    
    @visits = Visit.all
  end  

  def services
    authorize! :read, Visit    
    if @visit.services.present?
      @visit.services
    else
      @visit.services.build
    end
  end  


  def genrate_bill
    authorize! :read, Visit    
    @visit = Visit.find(params[:visit_id])
    @services = @visit.services
  end  



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def set_appointment 
      @appoitnemnt = Appointment.find(params[:appointment_id])
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:id, :patient_id, :appointment_id, :doctor_id, :date, basic_detail_attributes: [:blood_group, :boold_presure, :patient_id, :visit_id, :weight, :patient_history,:examination_details,:diagnosis, :id], prescription_details_attributes: [:id, :drug_name, :description,:schedule,:visit_id ],services_attributes: [:id, :service_name, :charges ,:visit_id ])
    end
end
