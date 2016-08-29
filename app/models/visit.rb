class Visit < ActiveRecord::Base
	belongs_to :patient
	belongs_to :department_doctor ,:foreign_key => :doctor_id
end
