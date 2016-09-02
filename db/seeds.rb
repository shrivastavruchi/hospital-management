# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		
		# @user = User.new(:email=>"admin@mailinator.com",:password=>"12345678",:password_confirmation=>"12345678")
		# if @user.save
		# 	@user.add_role(:admin)
		# end	


		Department.create(:department_name=>"Accident And Emergency",:department_description=>"maintain accident and emergency cases")
		Department.create(:department_name=>"General Surgery",:department_description=>"maintain general Surgery cases")
		Department.create(:department_name=>"Cardiology",:department_description=>"maintain  heart related cases")



