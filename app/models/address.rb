class Address < ActiveRecord::Base
	belongs_to :patient
	validates :country,:city,:presence=>true
	validates :pin_code, numericality: { only_integer: true }
end
