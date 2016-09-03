class Visit < ActiveRecord::Base
	belongs_to :patient
	belongs_to :appointment
	belongs_to :user ,:foreign_key => :doctor_id
	has_one :basic_detail
	has_many :prescription_details
	has_many :services
	
	accepts_nested_attributes_for :basic_detail
	accepts_nested_attributes_for :prescription_details
	accepts_nested_attributes_for :services

	validates :date ,:presence=>true
end



