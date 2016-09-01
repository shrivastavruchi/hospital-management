class Appointment < ActiveRecord::Base
	belongs_to :patient 
	belongs_to :department_doctor ,:foreign_key => :doctor_id
	has_one :visit
	#validates :patient_id,:doctor_id,:appoint_time,:date ,:presence=>true 


	#before_create :set_visit



	def set_visit

		if self.patient_id.present?
			patient = Patient.find(self.patient_id)
			visit = patient.visits.build(:doctor_id=>self.doctor_id,:date=>self.date)
			visit.save
		end
	end	

end
