require 'test_helper'

class StockItemsControllerTest < ActionController::TestCase
  setup do
    @stock_item = stock_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_item" do
    assert_difference('StockItem.count') do
      post :create, stock_item: { cost_centerable_id: @stock_item.cost_centerable_id, cost_centerable_type: @stock_item.cost_centerable_type, manufacturer: @stock_item.manufacturer, name: @stock_item.name }
    end

    assert_redirected_to stock_item_path(assigns(:stock_item))
  end

  test "should show stock_item" do
    get :show, id: @stock_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_item
    assert_response :success
  end

  test "should update stock_item" do
    patch :update, id: @stock_item, stock_item: { cost_centerable_id: @stock_item.cost_centerable_id, cost_centerable_type: @stock_item.cost_centerable_type, manufacturer: @stock_item.manufacturer, name: @stock_item.name }
    assert_redirected_to stock_item_path(assigns(:stock_item))
  end

  test "should destroy stock_item" do
    assert_difference('StockItem.count', -1) do
      delete :destroy, id: @stock_item
    end

    assert_redirected_to stock_items_path
  end
end
