class VisitRoomsController < ApplicationController
	before_action :set_visits ,:only=>[:new,:create,:index]

	def index
		@visit_rooms = @visit.visit_rooms
	end	

	def new
		@visit_room = VisitRoom.new
	end	

	def create
		@visit_room = @visit.visit_rooms.build(params_visit_room)
		if @visit_room.save
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


	private

	def set_visits
		@visit = Visit.find(params[:visit_id])
	end

	def params_visit_room
		params.require(:visit_room).permit(:date,:room_id,:bed_id,:visit_id)
	end	
end
