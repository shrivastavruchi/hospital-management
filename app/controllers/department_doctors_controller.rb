class DepartmentDoctorsController < ApplicationController
  before_action :set_department_doctor, only: [:show, :edit, :update, :destroy]
  before_action :find_department, only: [:create]
  def index
    authorize! :read, DepartmentDoctor
    @doctors = User.with_role :doctor
  end


  def show
    authorize! :read, DepartmentDoctor
  end


  def new
    authorize! :new, DepartmentDoctor
    @department_doctor = DepartmentDoctor.new
  end

  def edit
    authorize! :edit, DepartmentDoctor
  end


  def create
    authorize! :create, DepartmentDoctor
    @department_doctor = @department.department_doctors.build(department_doctor_params)

    respond_to do |format|
      if @department_doctor.save
        format.html { redirect_to department_doctors_path, notice: 'Department doctor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize! :update, DepartmentDoctor
    respond_to do |format|
      if @department_doctor.update(department_doctor_params)
        format.html { redirect_to department_doctors_path, notice: 'Department doctor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    authorize! :delete, DepartmentDoctor
    @department_doctor.destroy
    respond_to do |format|
      format.html { redirect_to department_doctors_url, notice: 'Department doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_department_doctor
      @department_doctor = DepartmentDoctor.find(params[:id])
    end

    def find_department
      @department = Department.find(params[:department_doctor][:department_id])
    end  
  

    def department_doctor_params
      params.require(:department_doctor).permit(:name, :age, :specialization, :email, :password, :department_id)
    end
end
