module PaymentsHelper

	def get_day(room)
		#DateTime.strptime(start_date, "%m/%d/%Y").to_date
		start_date = room.start_date.to_date.strftime("%m-%d-%Y").to_date
		if room.end_date.present?
			end_date = room.end_date.to_date.strftime("%m-%d-%Y").to_date
		else
			room_end_date = room.end_date = Time.now
			end_date = room_end_date.to_date.strftime("%d-%m-%Y").to_date
		end
			day = (end_date-start_date).to_i
	end	

	def get_amount(charges,quantity)
		amount= (charges.to_i*quantity.to_i).to_i
	end	
end
