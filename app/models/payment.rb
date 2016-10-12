class Payment < ActiveRecord::Base
	belongs_to :visit
	belongs_to :patient
	has_many :services

	after_create :discharge_visit


	def discharge_visit
		if self.visit.visit_type == "ipd"
			bed  = VisitRoom.where(:visit_id=>self.visit_id).last.bed  
			bed.update(:status=>nil) if bed.present?
		end	
		self.visit.update(:discharge_date=>self.created_at)
	end	
end
