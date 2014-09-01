require 'test_helper'

class TradingsControllerTest < ActionController::TestCase
  setup do
    @trading = tradings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tradings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trading" do
    assert_difference('Trading.count') do
      post :create, trading: {  }
    end

    assert_redirected_to trading_path(assigns(:trading))
  end

  test "should show trading" do
    get :show, id: @trading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trading
    assert_response :success
  end

  test "should update trading" do
    patch :update, id: @trading, trading: {  }
    assert_redirected_to trading_path(assigns(:trading))
  end

  test "should destroy trading" do
    assert_difference('Trading.count', -1) do
      delete :destroy, id: @trading
    end

    assert_redirected_to tradings_path
  end
end
