class WorksheetDetail < ActiveRecord::Base
	belongs_to :addmission
	belongs_to :user
	belongs_to :visit
end

