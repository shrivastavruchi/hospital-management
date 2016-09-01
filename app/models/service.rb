class Service < ActiveRecord::Base
	belongs_to :visit
	validates :service_name, :charges, :presence=>true
end
