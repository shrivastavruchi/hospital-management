class WorksheetDetail < ActiveRecord::Base
	belongs_to :addmission
	belongs_to :user
	belongs_to :visit
	#validates :blood_presure,:height,:weight ,:presence=>true
end

