class VisitRoomsController < ApplicationController
	before_action :set_visits ,:only=>[:new,:create,:index]

	def index
		@visit_rooms = @visit.visit_rooms
	end	

	def new
		@visit_room = VisitRoom.new
	end	

	def create
		bed = @visit.visit_rooms.last.bed if @visit.visit_rooms.last.bed.present?
		bed.update(:status=>nil) if bed.present?
		update_end_date
		@visit_room = @visit.visit_rooms.build(params_visit_room)
		if @visit_room.save
			bed = Bed.find_by_id(params[:visit_room][:bed_id])
			bed.update(:status=>"true")
			redirect_to visit_visit_rooms_path
		else
			render :new
		end	
	end		

	def destroy
		room = VisitRoom.find_by_visit_id(params[:visit_id])
		if room.destroy
			redirect_to visit_visit_rooms_path
		else
			render :index
		end		
	end	



	def billing
    
  end  


	


	private


	def update_end_date
		if @visit.visit_rooms.present?
			@visit.visit_rooms.last.end_date =  params[:visit_room][:start_date]	
			@visit.visit_rooms.last.save
		end			
	end	

	def set_visits
		@visit = Visit.find(params[:visit_id])
	end

	def params_visit_room
		params.require(:visit_room).permit(:room_id,:bed_id,:visit_id,:start_date,:end_date)
	end	
end
