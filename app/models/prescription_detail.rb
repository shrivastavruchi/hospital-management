class PrescriptionDetail < ActiveRecord::Base
	belongs_to :visit
	validates  :drug_name ,:description, :schedule ,:presence=>true
end
