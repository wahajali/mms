require 'test_helper'

class CenterTypesControllerTest < ActionController::TestCase
  setup do
    @center_type = center_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:center_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create center_type" do
    assert_difference('CenterType.count') do
      post :create, center_type: { name: @center_type.name }
    end

    assert_redirected_to center_type_path(assigns(:center_type))
  end

  test "should show center_type" do
    get :show, id: @center_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @center_type
    assert_response :success
  end

  test "should update center_type" do
    patch :update, id: @center_type, center_type: { name: @center_type.name }
    assert_redirected_to center_type_path(assigns(:center_type))
  end

  test "should destroy center_type" do
    assert_difference('CenterType.count', -1) do
      delete :destroy, id: @center_type
    end

    assert_redirected_to center_types_path
  end
end
