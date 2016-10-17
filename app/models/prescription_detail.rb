class PrescriptionDetail < ActiveRecord::Base
	belongs_to :visit
	belongs_to :addmission
	belongs_to :medicine
	validates  :medicine_id ,:description, :schedule ,:presence=>true


	def self.total_amount(visit)

		@total = 0
		if visit.prescription_details.present? 

			visit.prescription_details.each do |pd|
				 @total +=pd.quantity.to_i*pd.medicine.charges.to_i if pd.medicine.present?
			end
		end
		return @total
	end	
end
