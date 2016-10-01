class OperationTheater < ActiveRecord::Base
	belongs_to :visit
	belongs_to :user,:foreign_key => :doctor_id
end
