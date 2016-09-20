class PaymentsController < ApplicationController

	 def payment
    service_ids = params[:service_ids] 
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

  
end
