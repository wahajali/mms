require 'test_helper'

class MedicinesControllerTest < ActionController::TestCase
  setup do
    @medicine = medicines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine" do
    assert_difference('Medicine.count') do
      post :create, medicine: { approving_agency: @medicine.approving_agency, classification_type_1: @medicine.classification_type_1, classification_type_2: @medicine.classification_type_2, distributor: @medicine.distributor, expiry_duration_months: @medicine.expiry_duration_months, first_packing_unit_qty: @medicine.first_packing_unit_qty, form: @medicine.form, make: @medicine.make, manufacturer: @medicine.manufacturer, medicine_type: @medicine.medicine_type, name: @medicine.name, other_specifications: @medicine.other_specifications, potency: @medicine.potency, purpose: @medicine.purpose, second_packing_unit_qty: @medicine.second_packing_unit_qty, storage_instructions: @medicine.storage_instructions, third_packing_unit_qty: @medicine.third_packing_unit_qty }
    end

    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should show medicine" do
    get :show, id: @medicine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine
    assert_response :success
  end

  test "should update medicine" do
    patch :update, id: @medicine, medicine: { approving_agency: @medicine.approving_agency, classification_type_1: @medicine.classification_type_1, classification_type_2: @medicine.classification_type_2, distributor: @medicine.distributor, expiry_duration_months: @medicine.expiry_duration_months, first_packing_unit_qty: @medicine.first_packing_unit_qty, form: @medicine.form, make: @medicine.make, manufacturer: @medicine.manufacturer, medicine_type: @medicine.medicine_type, name: @medicine.name, other_specifications: @medicine.other_specifications, potency: @medicine.potency, purpose: @medicine.purpose, second_packing_unit_qty: @medicine.second_packing_unit_qty, storage_instructions: @medicine.storage_instructions, third_packing_unit_qty: @medicine.third_packing_unit_qty }
    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should destroy medicine" do
    assert_difference('Medicine.count', -1) do
      delete :destroy, id: @medicine
    end

    assert_redirected_to medicines_path
  end
end
