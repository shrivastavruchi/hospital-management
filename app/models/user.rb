class User < ActiveRecord::Base
  scope :all_except, ->(user) { where.not(id: user) }
	has_many :roles
	belongs_to :department
	has_many :appointments
	has_many :patients , :through => :appointments
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable
 


  ROLES = ['doctor','receptionist','chasier','pathlogist','ipd user','opd user']      
end
