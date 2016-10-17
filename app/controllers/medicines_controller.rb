class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:show, :edit, :update, :destroy]

  # GET /medicines
  # GET /medicines.json
  def index
    @medicines = Medicine.all
  end

  # GET /medicines/1
  # GET /medicines/1.json
  def show
  end

  # GET /medicines/new
  def new
    @medicine = Medicine.new
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines
  # POST /medicines.json
  def create
    @medicine = Medicine.new(medicine_params)
    if @medicine.save
      redirect_to medicines_path
    else
      render :new
    end  
  end

  # PATCH/PUT /medicines/1
  # PATCH/PUT /medicines/1.json
  def update
    if @medicine.update(medicine_params)
      redirect_to medicines_path
    else
      render :edit  
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to medicines_url, notice: 'Medicine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def export
    @medicines = Medicine.all
    respond_to do |format|
      format.csv { send_data Medicine.to_csv }
    end
  end  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = Medicine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicine_params
      params.require(:medicine).permit(:medicine_name, :charges,:expire_date,:quantity)
    end
end
