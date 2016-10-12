module VisitsHelper

	def get_visit_rooms(visit)
		@visit_room = VisitRoom.find_by_visit_id(visit.id)
		@visit_room.room.room_no
	end	
end
