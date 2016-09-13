class PrescriptionDetail < ActiveRecord::Base
	belongs_to :visit
	belongs_to :addmission
	validates  :drug_name ,:description, :schedule ,:presence=>true
end
