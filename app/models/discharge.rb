class Discharge < ActiveRecord::Base
	belongs_to :visit
	validates :final_diagnoses ,:reason_for_addmission, :presence=>true
end
