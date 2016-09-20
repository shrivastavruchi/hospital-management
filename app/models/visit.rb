class Visit < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user ,:foreign_key => :doctor_id
	has_one :basic_detail
	has_many :prescription_details
	#has_one :addmission
	has_many :diagnoses
	has_many :worksheet_details
	has_many :notes
	has_one :discharge
	has_many :services
	has_many :payments
	accepts_nested_attributes_for :basic_detail
	accepts_nested_attributes_for :prescription_details
	accepts_nested_attributes_for :services

	

	validates :date ,:presence=>true
	
end



