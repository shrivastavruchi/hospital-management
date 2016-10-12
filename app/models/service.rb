class Service < ActiveRecord::Base
	belongs_to :visit
	belongs_to :payment
	validates :service_name, :charges, :presence=>true
	has_many :visit_services
	has_many :visits,:through=>:visit_services
end
