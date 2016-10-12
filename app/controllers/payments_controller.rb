class PaymentsController < ApplicationController




  def new
    authorize! :new, Payment
    @visit = Visit.find(params[:visit_id])
    @visit_service = @visit.visit_services
    @prescription_details = @visit.prescription_details
    @rooms = @visit.visit_rooms
  end  


  def create
    authorize! :create, Payment

    @visit = Visit.find(params[:visit_id])
    if @visit.payment.present? 
      redirect_to dashboard_path ,:notice=> 'payment have done '
    else
      @payment = @visit.build_payment(:total_amount=>params[:total_amount] )
      if  @payment.save
        redirect_to genrate_report_path(@visit)
      end  
    end   
  end   


	 def payment
    service_ids = params[:servsice_ids] 
    @visit = Visit.find(params[:visit_id])
    total=0
    if service_ids.present?
      services = Service.where("id IN (?)", service_ids)
      services.update_all(:paid=>"true")
      total = services.map(&:charges).map{|v| v.to_f}.sum
    end 
    payment = @visit.payments.build(:total_amount=>total,:visit_id=>@visit)
    if payment.save
      payment = Payment.where(:visit_id=>@visit).last
      services = Service.where("id IN (?)", service_ids)
      services.update_all(:payment_id=>payment.id)

      redirect_to visit_all_services_path(@visit)
    end  
  end  


  def print_receipt
    authorize! :payment_receipt, Payment
    @visit = Visit.find(params[:visit_id])
    @visit_service = @visit.visit_services
    @prescription_details = @visit.prescription_details
    @rooms = @visit.visit_rooms
  end

end
