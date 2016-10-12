class User < ActiveRecord::Base
  require 'rubygems'
  require 'twilio-ruby'
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
 


  ROLES = ['doctor','receptionist','chasier','pathlogist','chasier']      

  def send_sms
    account_sid = "AC520aeff208c6d56a2cd5fe08f7773904"
    auth_token = "b0ffe1fc9bb910387ac147759ba98bf1"
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(from: '+12562902676',
                                to: '+918602512665',
                                body: 'Hey there!'
                              )
  end  

end
