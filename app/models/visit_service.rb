class VisitService < ActiveRecord::Base
	belongs_to :visit
	belongs_to :service



	def self.total_amount(visit)

		@total = 0
		if visit.visit_services.present? 

			visit.visit_services.each do |v_service|
				 @total +=v_service.quantity.to_i*v_service.service.charges.to_i if v_service.service.present?
			end
		end
		return @total
	end
end
