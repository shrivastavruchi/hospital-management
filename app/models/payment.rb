class Payment < ActiveRecord::Base
	belongs_to :visit
	belongs_to :patient
	has_many :services

	after_create :discharge_visit
	after_create :visit_room_release


	def discharge_visit
		if self.visit.visit_type == "ipd"
			bed  = VisitRoom.where(:visit_id=>self.visit_id).last.bed  
			bed.update(:status=>nil) if bed.present?
		end	
		self.visit.update(:discharge_date=>self.created_at)
	end	

	def visit_room_release
		v_room = VisitRoom.where(:visit_id=>self.visit_id).last
		
		v_room.update(:end_date=>self.created_at.to_date.strftime("%m/%d/%Y"))
	end

end
