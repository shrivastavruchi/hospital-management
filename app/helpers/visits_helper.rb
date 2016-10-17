module VisitsHelper

	def get_visit_rooms(visit)
		@visit_room = VisitRoom.find_by_visit_id(visit.id)
		@visit_room.room.room_no if @visit_room.present? && @visit_room.room.present?
	end	

	def get_bed(visit)
		@visit_room = VisitRoom.find_by_visit_id(visit.id)
		@visit_room.bed.bed_no if @visit_room.present? && @visit_room.bed.present?
	end	
end
