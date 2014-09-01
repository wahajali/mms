require 'test_helper'

class ManufacturingsControllerTest < ActionController::TestCase
  setup do
    @manufacturing = manufacturings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufacturings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufacturing" do
    assert_difference('Manufacturing.count') do
      post :create, manufacturing: {  }
    end

    assert_redirected_to manufacturing_path(assigns(:manufacturing))
  end

  test "should show manufacturing" do
    get :show, id: @manufacturing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manufacturing
    assert_response :success
  end

  test "should update manufacturing" do
    patch :update, id: @manufacturing, manufacturing: {  }
    assert_redirected_to manufacturing_path(assigns(:manufacturing))
  end

  test "should destroy manufacturing" do
    assert_difference('Manufacturing.count', -1) do
      delete :destroy, id: @manufacturing
    end

    assert_redirected_to manufacturings_path
  end
end
