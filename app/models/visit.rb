class Visit < ActiveRecord::Base
	belongs_to :patient
	belongs_to :department_doctor ,:foreign_key => :doctor_id
	has_one :basic_detail
	accepts_nested_attributes_for :basic_detail
end
