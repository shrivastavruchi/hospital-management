class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]


  def index
    authorize! :read, Room
    @rooms = Room.all
  end

 
  def show
    authorize! :show, Bed
  end

  
  def new
    authorize! :create, Bed
    @room = Room.new
  end

 
  def edit
    authorize! :edit, Bed
  end

  
  def create
    authorize! :create, Bed
    @room = Room.new(room_params)
    if @room.save
        redirect_to rooms_path, notice: 'Room was successfully created.' 
    else
      render :new 
    end
  end

  
  def update
    authorize! :update, Bed
    if @room.update(room_params)
      redirect_to rooms_path, notice: 'Room was successfully updated.'
    else
      render :edit 
    end
  end

 
  def show
    @room = Room.find(params[:id])
    @beds = @room.beds.where(:status=>nil)
    respond_to do |format|
      format.js # actually means: if the client ask for js -> return file.js
    end
  end  

  def destroy
    authorize! :destroy, Bed
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
