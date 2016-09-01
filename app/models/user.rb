class User < ActiveRecord::Base
  scope :all_except, ->(user) { where.not(id: user) }
	has_many :roles
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable
 


  ROLES = ['receptionist','chasier','ipd user','opd user']      
end
