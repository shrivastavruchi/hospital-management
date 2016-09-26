class Room < ActiveRecord::Base
	belongs_to :category
	has_many :visit_rooms
	has_many :visits, :through=>:visit_rooms
	has_many :beds
end
