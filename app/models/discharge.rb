class Discharge < ActiveRecord::Base
	belongs_to :visit
	validates :discharge_date, :presence=>true
end
