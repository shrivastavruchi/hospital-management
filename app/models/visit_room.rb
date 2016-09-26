class VisitRoom < ActiveRecord::Base
	belongs_to :visit
	belongs_to :room
	belongs_to :bed
end
