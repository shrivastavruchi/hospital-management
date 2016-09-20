class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :destroy,:prescription_detail,:services,:basic_detail,:discharge,:discharge_visit]
  before_action :set_patient, only: [:new, :create]
  layout 'patient', only: [:basic_detail,:show,:discharge]

  # GET /visits
  # GET /visits.json
  def index
    authorize! :read, Visit
    if current_user.has_role?(:doctor)
      @visits =  Visit.where(:doctor_id=>current_user.id)
    else
      @visits = Visit.all
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    authorize! :show, Visit
  end

  # GET /visits/new
  def new
    authorize! :new, Visit
    @visit = Visit.new
    @doctors = User.with_role :doctor
    #@visit.build_basic_detail
    #@visit.prescription_details.build
  end

  # GET /visits/1/edit
  def edit
    authorize! :edit, Visit
  end

  # POST /visits
  # POST /visits.json
  def create
    authorize! :create, Visit
      @visit =  @patient.visits.build(visit_params) 
        if @visit.save
          if params[:visit][:visit_type] == "opd"
            redirect_to opd_visits_path, notice: 'Opd Visit was successfully created.'
          else
            redirect_to ipd_visits_path, notice: 'Ipd Visit was successfully created.'
          end  
        else
          render :new 
        end 
    end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    authorize! :update, Visit
      if @visit.update(visit_params)
        redirect_to visits_path, notice: 'Visit was successfully updated.' 
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

    @q = Visit.ransack(params[:q])
    @visits = @q.result.includes(:patient)
    @doctors = User.with_role(:doctor)
    if current_user.has_role?(:doctor)  
      @visits = Visit.where("visit_type=? and doctor_id=?", "opd",current_user.id)
    else  
      @visits = Visit.where(:visit_type=>"opd")
    end
  end  

  def services
    authorize! :services, Visit    
    if @visit.services.present?
      @visit.services
    else
      @visit.services.build
    end
  end  


  def all_services
    authorize! :read, Visit  
    @visit = Visit.find(params[:visit_id])
    @services = @visit.services
  end  

  def ipd_visits
    authorize! :read, Visit 
    if current_user.has_role?(:doctor)  
     @visits = Visit.where("visit_type=? and doctor_id=?", "ipd",current_user.id)
    else  
      @visits = Visit.where(:visit_type=>"ipd")
    end
  end  

  def basic_detail
    authorize! :read, Visit 
  end   

  def genrate_bill
    @visit = Visit.find(params[:visit_id])
    payment = Payment.where("visit_id=?", params[:visit_id]).last
    @services = payment.services
  end  

  def search
    @q = Visit.ransack(params[:q])
    @visits = @q.result.includes(:user)
    render :opd_visit
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
      params.require(:visit).permit(:id, :patient_id, :appointment_id,:room_no, :doctor_id,:visit_type, :date, basic_detail_attributes: [:blood_group, :boold_presure, :patient_id, :visit_id, :weight, :patient_history,:examination_details,:diagnosis, :id], prescription_details_attributes: [:id, :drug_name, :description,:schedule,:visit_id ],services_attributes: [:id, :service_name, :charges ,:visit_id ] )
    end
end
