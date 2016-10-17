class VisitRoom < ActiveRecord::Base
	belongs_to :visit
	belongs_to :room
	belongs_to :bed

	def self.total_amount(visit)
		@total = 0
		if visit.visit_rooms.present?
			visit.visit_rooms.each do |visit_room|

			@total +=	visit_room.get_day*visit_room.room.room_rent.to_i if visit_room.room.present?
			end	
		end	
		@total
	end	

	def get_day
		start_date = DateTime.strptime(self.start_date, "%m/%d/%Y").to_date
		if self.end_date.present?
			end_date = DateTime.strptime(self.end_date, "%m/%d/%Y").to_date
		else
			room_end_date = self.end_date = Time.now
			end_date = room_end_date.to_date	
		end	
			day = (end_date+1.day-start_date).to_i
	end	
end




# def get_day(room)
# 		#DateTime.strptime(start_date, "%m/%d/%Y").to_date
# 		start_date = DateTime.strptime(room.start_date, "%m/%d/%Y").to_date
# 		if room.end_date.present?
# 			end_date = room.end_date.to_date.strftime("%m-%d-%Y").to_date
# 		else
# 			room_end_date = room.end_date = Time.now
# 			end_date = room_end_date.to_date
# 		end
# 			day = (end_date-start_date).to_i
# 	end	
