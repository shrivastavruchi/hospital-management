module PaymentsHelper

	
	def get_amount(charges,quantity)
		amount= (charges.to_i*quantity.to_i).to_i
	end	
end
