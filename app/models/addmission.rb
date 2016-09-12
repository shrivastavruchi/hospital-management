class Addmission < ActiveRecord::Base
	# belongs_to :patient
	# belongs_to :user ,:foreign_key => :doctor_id
	belongs_to :visit
	has_many :worksheet_details

	validate :valid_date


	def valid_date
		if self.addmission_date > self.discharge_date 
			errors.add(:base, 'discharge date should be grater than to addmission date')
		end
	end		

end
