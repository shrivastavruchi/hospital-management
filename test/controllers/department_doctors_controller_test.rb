require 'test_helper'

class DepartmentDoctorsControllerTest < ActionController::TestCase
  setup do
    @department_doctor = department_doctors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_doctors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_doctor" do
    assert_difference('DepartmentDoctor.count') do
      post :create, department_doctor: { age: @department_doctor.age, department_id: @department_doctor.department_id, email: @department_doctor.email, name: @department_doctor.name, password: @department_doctor.password, specialization: @department_doctor.specialization }
    end

    assert_redirected_to department_doctor_path(assigns(:department_doctor))
  end

  test "should show department_doctor" do
    get :show, id: @department_doctor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_doctor
    assert_response :success
  end

  test "should update department_doctor" do
    patch :update, id: @department_doctor, department_doctor: { age: @department_doctor.age, department_id: @department_doctor.department_id, email: @department_doctor.email, name: @department_doctor.name, password: @department_doctor.password, specialization: @department_doctor.specialization }
    assert_redirected_to department_doctor_path(assigns(:department_doctor))
  end

  test "should destroy department_doctor" do
    assert_difference('DepartmentDoctor.count', -1) do
      delete :destroy, id: @department_doctor
    end

    assert_redirected_to department_doctors_path
  end
end
