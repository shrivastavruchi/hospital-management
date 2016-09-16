class DischargesController < ApplicationController
  before_action :set_visit,only: [:new,:create]
  before_action :set_discharge, only: [:show, :edit, :update, :destroy]

  # GET /discharges
  # GET /discharges.json
  def index
    authorize! :read, Discharge
    @discharges = Discharge.all
  end

  # GET /discharges/1
  # GET /discharges/1.json
  def show
    authorize! :show, Discharge
  end

  # GET /discharges/new
  def new
    authorize! :create, Discharge
    @discharge = Discharge.new
  end

  # GET /discharges/1/edit
  def edit
    authorize! :edit, Discharge
  end

  # POST /discharges
  # POST /discharges.json
  def create
    authorize! :create, Discharge
    unless @visit.discharge.present?
      @discharge = @visit.build_discharge(discharge_params)
      if @discharge.save
        redirect_to visits_path, notice: 'Discharge was successfully created.' 
      else
        render :new 
      end  
    end  
  end

  # PATCH/PUT /discharges/1
  # PATCH/PUT /discharges/1.json
  def update
    authorize! :update, Discharge
    respond_to do |format|
      if @discharge.update(discharge_params)
        format.html { redirect_to @discharge, notice: 'Discharge was successfully updated.' }
        format.json { render :show, status: :ok, location: @discharge }
      else
        format.html { render :edit }
        format.json { render json: @discharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discharges/1
  # DELETE /discharges/1.json
  def destroy
    authorize! :destroy, Discharge
    @discharge.destroy
    respond_to do |format|
      format.html { redirect_to discharges_url, notice: 'Discharge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discharge
      @discharge = Discharge.find(params[:id])
    end

    def set_visit
      @visit = Visit.find(params[:visit_id])
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def discharge_params
      params.require(:discharge).permit(:discharge_date,:final_diagnoses,:visit_id)
    end
end
