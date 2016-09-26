class BedsController < ApplicationController
  before_action :set_bed, only: [:show, :edit, :update, :destroy]

  # GET /beds
  # GET /beds.json
  def index
    authorize! :read, Bed
    @beds = Bed.all
  end

  # GET /beds/1
  # GET /beds/1.json
  def show
  end

  # GET /beds/new
  def new
    authorize! :new, Bed
    @bed = Bed.new
  end

  # GET /beds/1/edit
  def edit
    authorize! :edit, Bed
  end

  # POST /beds
  # POST /beds.json
  def create
    authorize! :create, Bed
    @bed = Bed.new(bed_params)
    if @bed.save
      redirect_to beds_path, notice: 'Bed was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /beds/1
  # PATCH/PUT /beds/1.json
  def update
    authorize! :update, Bed
    if @bed.update(bed_params)
      redirect_to beds_path, notice: 'Bed was successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /beds/1
  # DELETE /beds/1.json
  def destroy
    authorize! :destroy, Bed
    if @bed.destroy
      redirect_to beds_path, notice: 'Bed was successfully destroyed.' 
    end
  end

  def admit
    @bed=Bed.find(params[:bed_id])
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bed
      @bed = Bed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bed_params
      params.require(:bed).permit(:bed_no, :room_id)
    end
end
