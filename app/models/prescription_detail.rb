class PrescriptionDetail < ActiveRecord::Base
	belongs_to :visit
	belongs_to :addmission
	belongs_to :medicine
	validates  :medicine_id ,:description, :schedule ,:presence=>true
end
