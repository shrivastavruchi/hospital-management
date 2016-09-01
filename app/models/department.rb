class Department < ActiveRecord::Base
	 has_many :department_doctors
end
