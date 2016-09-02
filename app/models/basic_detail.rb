class BasicDetail < ActiveRecord::Base
	belongs_to :visit 
	validates :examination_details, :blood_group,:presence=>true

end



