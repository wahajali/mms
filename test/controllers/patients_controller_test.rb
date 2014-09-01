require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { blood_group: @patient.blood_group, card_date: @patient.card_date, card_no: @patient.card_no, dob: @patient.dob, fathers_name: @patient.fathers_name, financial_type: @patient.financial_type, first_name: @patient.first_name, gender: @patient.gender, husbands_name: @patient.husbands_name, last_name: @patient.last_name, marital_status: @patient.marital_status, mothers_name: @patient.mothers_name, patient_type: @patient.patient_type, referred_by: @patient.referred_by, treatment_type: @patient.treatment_type }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { blood_group: @patient.blood_group, card_date: @patient.card_date, card_no: @patient.card_no, dob: @patient.dob, fathers_name: @patient.fathers_name, financial_type: @patient.financial_type, first_name: @patient.first_name, gender: @patient.gender, husbands_name: @patient.husbands_name, last_name: @patient.last_name, marital_status: @patient.marital_status, mothers_name: @patient.mothers_name, patient_type: @patient.patient_type, referred_by: @patient.referred_by, treatment_type: @patient.treatment_type }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
