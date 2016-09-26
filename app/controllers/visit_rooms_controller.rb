class VisitRoomsController < ApplicationController
	before_action :set_visits ,:only=>[:new,:create]

	def index
		@visit_room = VisitRoom.all
	end	

	def new
		@visit_room = VisitRoom.new
	end	

	def create
		@visit_room = @visit.visit_rooms.build(params_visit_room)
		if @visit_room.present?
			redirect_to visit_rooms_path
		else
			render :new
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
