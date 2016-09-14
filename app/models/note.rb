class Note < ActiveRecord::Base
	belongs_to :addmission
	belongs_to :visit
end
