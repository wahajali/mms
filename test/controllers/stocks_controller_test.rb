require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, stock: { expiry: @stock.expiry, medicine_id: @stock.medicine_id, present_stock: @stock.present_stock, purchase_date: @stock.purchase_date, purchase_details: @stock.purchase_details, purchase_price: @stock.purchase_price, purchase_qty: @stock.purchase_qty }
    end

    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock
    assert_response :success
  end

  test "should update stock" do
    patch :update, id: @stock, stock: { expiry: @stock.expiry, medicine_id: @stock.medicine_id, present_stock: @stock.present_stock, purchase_date: @stock.purchase_date, purchase_details: @stock.purchase_details, purchase_price: @stock.purchase_price, purchase_qty: @stock.purchase_qty }
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end
