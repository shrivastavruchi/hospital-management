class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  def index
    @rooms = Room.all
  end

 
  def show
  end

  
  def new
    @room = Room.new
  end

 
  def edit
  end

  
  def create
    @room = Room.new(room_params)
    if @room.save
        redirect_to rooms_path, notice: 'Room was successfully created.' 
    else
      render :new 
    end
  end

  
  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: 'Room was successfully updated.'
    else
      render :edit 
    end
  end

 
  def destroy
    if @room.destroy
      redirect_to rooms_path, notice: 'Room was successfully destroyed.' 
    end
  end

  private
    
    def set_room
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:room_no, :category_id, :room_rent, :beds)
    end
end
