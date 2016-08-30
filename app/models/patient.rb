class Patient < ActiveRecord::Base
	has_one :address
	has_many :appointments
	has_many :visits
	accepts_nested_attributes_for :address
end
