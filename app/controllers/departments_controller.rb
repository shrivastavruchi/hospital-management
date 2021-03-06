class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    authorize! :read, Department
    @departments = Department.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    authorize! :read, Department
  end

  # GET /departments/new
  def new
    authorize! :create, Department
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
    authorize! :edit, Department
  end

  # POST /departments
  # POST /departments.json
  def create
    authorize! :create, Department
    @department = Department.new(department_params)
    if @department.save
      redirect_to  departments_path, notice: 'Department was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    authorize! :update, Department
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @departments, notice: 'Department was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    authorize! :destroy, Department
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:department_name, :department_description)
    end
end
