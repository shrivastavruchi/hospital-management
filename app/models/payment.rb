class Payment < ActiveRecord::Base
	belongs_to :visit
	belongs_to :patient
	has_many :services
end
