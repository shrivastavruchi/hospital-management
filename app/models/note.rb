class Note < ActiveRecord::Base
	belongs_to :addmission
	belongs_to :visit

	validates :date, :time,:progress,:treatment, :presence=>true
end
