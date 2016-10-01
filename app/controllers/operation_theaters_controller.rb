class OperationTheatersController < ApplicationController
  before_action :set_operation_theater, only: [:show, :edit, :update, :destroy]
  before_action :set_visits ,only: [:new,:create,:index,:show]
  layout "patient"
  # GET /operation_theaters
  # GET /operation_theaters.json
  def index
    @operation_theaters = @visit.operation_theaters
  end

  # GET /operation_theaters/1
  # GET /operation_theaters/1.json
  def show
    #render :layout => false
  end

  # GET /operation_theaters/new
  def new
    @operation_theater = OperationTheater.new
    @doctor = @visit.user
  end

  # GET /operation_theaters/1/edit
  def edit
  end

  # POST /operation_theaters
  # POST /operation_theaters.json
  def create
    @operation_theater = @visit.operation_theaters.build( operation_theater_params)
    if @operation_theater.save
      redirect_to visit_operation_theater_path(@visit, @operation_theater) ,notice: 'Operation theater was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /operation_theaters/1
  # PATCH/PUT /operation_theaters/1.json
  def update
    respond_to do |format|
      if @operation_theater.update(operation_theater_params)
        format.html { redirect_to @operation_theater, notice: 'Operation theater was successfully updated.' }
        format.json { render :show, status: :ok, location: @operation_theater }
      else
        format.html { render :edit }
        format.json { render json: @operation_theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operation_theaters/1
  # DELETE /operation_theaters/1.json
  def destroy
    @operation_theater.destroy
    respond_to do |format|
      format.html { redirect_to operation_theaters_url, notice: 'Operation theater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation_theater
      @operation_theater = OperationTheater.find(params[:id])
    end

    def set_visits
      @visit = Visit.find(params[:visit_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_theater_params
      params.require(:operation_theater).permit(:visit_id, :from_date, :end_date, :end_time, :operation_name, :doctor_id, :from_time, :notes, :operation_procedure)
    end
end
