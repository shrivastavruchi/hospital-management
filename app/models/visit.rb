class Visit < ActiveRecord::Base
	belongs_to :patient
	belongs_to :user ,:foreign_key => :doctor_id
	has_one :basic_detail
	has_many :prescription_details
	#has_one :addmission
	has_many :diagnoses
	has_many :worksheet_details 
	has_many :notes
	has_one :discharge
	has_many :services
	has_one :payment
	
	has_many :visit_rooms
	has_many :rooms, :through=>:visit_rooms
	has_many :operation_theaters
	after_create :booked_bed
	after_create :update_start_date

	accepts_nested_attributes_for :services
	accepts_nested_attributes_for :visit_rooms

	has_many :visit_services 
	has_many :services ,:through=>:visit_services

	validates :doctor_id, :date, :presence=>true
	

	def booked_bed
		visit_room = VisitRoom.find_by_visit_id(self.id)
		if visit_room.present?
			bed = Bed.find(visit_room.bed_id)
			bed.update(:status=>"true")
		end
	end	


	def self.dashboard(current_user)
		if current_user.has_role?(:doctor)
     	@visits =  Visit.where(:doctor_id=>current_user.id)
    else
    	@visits = Visit.all
   	end 	
	end

	def self.fetch_visit_of_doctors(current_user ,string)
		if current_user.has_role?(:doctor)  
			@visits = self.where("visit_type=? and doctor_id=?", string ,current_user.id)
		else
			@visits = self.where(:visit_type=>string)
		end		
	end

	def update_start_date
		visit_room = VisitRoom.find_by_visit_id(self.id)
		visit_room.update(:start_date=>self.date) if visit_room.present?
	end	

	# def total_amount
	# 	# @total = 0
	# 	# if self.prescription_details.present? 

	# 	# 	self.prescription_details.each do |pd|
	# 	# 		 @total +=pd.quantity.to_i*pd.medicine.charges.to_i
	# 	# 	end
	# 	# end
	# 	# # if self.visit_rooms.present?
	# 	# # 	self.visit_rooms.each do |visit_room|
	# 	# # 		@total += visit_room.room.room_rent.to_i
	# 	# # 	end	
	# 	# # end	
	# 	# # if self.visit_services.present?
	# 	# # 	self.visit_services.each do |visit_service|
	# 	# # 		@total +=visit_service.quantity.to_i*visit_service.service.charges.to_i
	# 	# # 	end	
	# 	# # end
	# 	# return @total	
	# end		
end











