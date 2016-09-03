  class AddmissionsController < ApplicationController
  before_action :set_addmission, only: [:show, :edit, :update, :destroy]

  # GET /addmissions
  # GET /addmissions.json
  def index
    @addmissions = Addmission.all
  end

  # GET /addmissions/1
  # GET /addmissions/1.json
  def show
  end

  # GET /addmissions/new
  def new
    @addmission = Addmission.new
    @doctors = User.with_role :doctor
  end

  # GET /addmissions/1/edit
  def edit
  end

  # POST /addmissions
  # POST /addmissions.json
  def create
    @addmission = Addmission.new(addmission_params)

    if @addmission.save
      redirect_to addmissions_path, notice: 'Addmission was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /addmissions/1
  # PATCH/PUT /addmissions/1.json
  def update
    respond_to do |format|
      if @addmission.update(addmission_params)
        format.html { redirect_to @addmission, notice: 'Addmission was successfully updated.' }
        format.json { render :show, status: :ok, location: @addmission }
      else
        format.html { render :edit }
        format.json { render json: @addmission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addmissions/1
  # DELETE /addmissions/1.json
  def destroy
    @addmission.destroy
    respond_to do |format|
      format.html { redirect_to addmissions_url, notice: 'Addmission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addmission
      @addmission = Addmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addmission_params
      params.require(:addmission).permit(:visit_id, :doctor_id, :patient_id, :addmission_date, :discharge_date)
    end
end
