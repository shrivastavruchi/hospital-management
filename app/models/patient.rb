class Patient < ActiveRecord::Base
	has_one :address
	has_many :appointments
	accepts_nested_attributes_for :address

	validates :patient_name, :gender, :presence=>true 
	validates :age, numericality: { only_integer: true }
end
