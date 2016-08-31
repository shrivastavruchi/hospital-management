class Patient < ActiveRecord::Base
	has_one :address
	has_many :appointments
	accepts_nested_attributes_for :address
end
