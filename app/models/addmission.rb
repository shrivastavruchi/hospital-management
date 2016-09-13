class Addmission < ActiveRecord::Base

	belongs_to :patient
	belongs_to :user, :foreign_key => :doctor_id
	has_many :notes
	has_many :worksheet_details
	has_many :diagnosis
	has_many :prescription_details

	validate :valid_date



	def valid_date
		if self.addmission_date > self.discharge_date 
			errors.add(:base, 'discharge date should be grater than to addmission date')
		end
	end		

end
