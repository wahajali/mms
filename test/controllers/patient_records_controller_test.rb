require 'test_helper'

class PatientRecordsControllerTest < ActionController::TestCase
  setup do
    @patient_record = patient_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_record" do
    assert_difference('PatientRecord.count') do
      post :create, patient_record: { checked_bp: @patient_record.checked_bp, checked_height: @patient_record.checked_height, checked_weight: @patient_record.checked_weight, conducted_physical_examination: @patient_record.conducted_physical_examination, diabetic_history: @patient_record.diabetic_history, doctor_id: @patient_record.doctor_id, handling_person: @patient_record.handling_person, lscs: @patient_record.lscs, no_of_children: @patient_record.no_of_children, patient_id: @patient_record.patient_id, present_complaint: @patient_record.present_complaint, visit_date_english: @patient_record.visit_date_english, visit_date_islamic: @patient_record.visit_date_islamic, visit_day: @patient_record.visit_day, youngest_child_age: @patient_record.youngest_child_age }
    end

    assert_redirected_to patient_record_path(assigns(:patient_record))
  end

  test "should show patient_record" do
    get :show, id: @patient_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_record
    assert_response :success
  end

  test "should update patient_record" do
    patch :update, id: @patient_record, patient_record: { checked_bp: @patient_record.checked_bp, checked_height: @patient_record.checked_height, checked_weight: @patient_record.checked_weight, conducted_physical_examination: @patient_record.conducted_physical_examination, diabetic_history: @patient_record.diabetic_history, doctor_id: @patient_record.doctor_id, handling_person: @patient_record.handling_person, lscs: @patient_record.lscs, no_of_children: @patient_record.no_of_children, patient_id: @patient_record.patient_id, present_complaint: @patient_record.present_complaint, visit_date_english: @patient_record.visit_date_english, visit_date_islamic: @patient_record.visit_date_islamic, visit_day: @patient_record.visit_day, youngest_child_age: @patient_record.youngest_child_age }
    assert_redirected_to patient_record_path(assigns(:patient_record))
  end

  test "should destroy patient_record" do
    assert_difference('PatientRecord.count', -1) do
      delete :destroy, id: @patient_record
    end

    assert_redirected_to patient_records_path
  end
end
