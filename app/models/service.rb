class Service < ActiveRecord::Base
	belongs_to :visit
	belongs_to :payment
	validates :service_name, :charges, :presence=>true

end
