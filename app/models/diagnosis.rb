class Diagnosis < ActiveRecord::Base
	belongs_to :addmission
	belongs_to :visit
	validates :name ,:presence=>true
end
