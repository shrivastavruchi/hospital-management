class VisitsController < ApplicationController
  include PatientVisits

  def index
    authorize! :read, Visit
    @visits = Visit.dashboard(current_user)
  end

  def show
    authorize! :show, Visit
  end


  def new
    authorize! :new, Visit
    @visit = Visit.new
    @visit.visit_rooms.build
  end

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
          params[:visit_type] = params[:visit][:visit_type]
          @doctors = User.with_role :doctor
          render :new 
        end 
    end

  def update
    authorize! :update, Visit
      if @visit.update(visit_params)
        redirect_to visits_path, notice: 'Visit was successfully updated.' 
      else
        render :services
      end
  end


  def prescription_detail
    authorize! :read, Visit
    @prescription_details = @visit.prescription_details
  end  

  def opd_visit
    authorize! :read, Visit   
    @visits = Visit.fetch_visit_of_doctors(current_user,"opd")
  end  

  # def services
  #   authorize! :services, Visit    
  #   if @visit.services.present?
  #     @visit.services
  #   else
  #     @visit.services.build
  #   end
  # end  


  # def all_services
  #   authorize! :read, Visit  
  #   @visit = Visit.find(params[:visit_id])
  #   @services = @visit.services
  # end  

  def ipd_visits
    authorize! :read, Visit 
    @visits = Visit.fetch_visit_of_doctors(current_user,"ipd") 
  end  

  def basic_detail
    authorize! :read, Visit 
  end   

  # def genrate_bill
  #   @visit = Visit.find(params[:visit_id])
  #   payment = Payment.where("visit_id=?", params[:visit_id]).last
  #   @services = payment.services
  #end  


  def search_visits
    @from_date= params[:from_date]
    @end_date = params[:end_date]
    if params[:visit_type] == "ipd"
      @visits = Visit.where(:date=>@from_date..@end_date, :doctor_id=>current_user.id,:visit_type=>"ipd")
      #@visits = Visit.where("doctor_id=?" ,current_user.id).joins(:visit_rooms).where("visit_rooms.start_date >= ? and visit_rooms.start_date <= ? ",@from_date, @end_date)
    else
      @visits = Visit.where(:date=>@from_date..@end_date, :doctor_id=>current_user.id,:visit_type=>"opd")
    end  
  end  

  def dashboard
    @discharges = Discharge.all
  end  
  def billing
    @discharges = Discharge.all
  end


  def paid_bill
    @visits = Visit.joins(:payment)
  end  


  private  


    def visit_params
      params.require(:visit).permit(:id, :patient_id, :appointment_id,:room_id,:bed_id, :doctor_id,:visit_type, :date, basic_detail_attributes: [:blood_group, :boold_presure, :patient_id, :visit_id, :weight, :patient_history,:examination_details,:diagnosis, :id], prescription_details_attributes: [:id, :drug_name, :description,:schedule,:visit_id ],services_attributes: [:id, :service_name, :charges ,:visit_id ],visit_rooms_attributes: [:id, :date, :room_id , :bed_id,:visit_id ] )
    end
end
