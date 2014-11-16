require 'test_helper'

class BsOrPlCategoriesControllerTest < ActionController::TestCase
  setup do
    @bs_or_pl_category = bs_or_pl_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bs_or_pl_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bs_or_pl_category" do
    assert_difference('BsOrPlCategory.count') do
      post :create, bs_or_pl_category: { bl_or_pl: @bs_or_pl_category.bl_or_pl, name: @bs_or_pl_category.name }
    end

    assert_redirected_to bs_or_pl_category_path(assigns(:bs_or_pl_category))
  end

  test "should show bs_or_pl_category" do
    get :show, id: @bs_or_pl_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bs_or_pl_category
    assert_response :success
  end

  test "should update bs_or_pl_category" do
    patch :update, id: @bs_or_pl_category, bs_or_pl_category: { bl_or_pl: @bs_or_pl_category.bl_or_pl, name: @bs_or_pl_category.name }
    assert_redirected_to bs_or_pl_category_path(assigns(:bs_or_pl_category))
  end

  test "should destroy bs_or_pl_category" do
    assert_difference('BsOrPlCategory.count', -1) do
      delete :destroy, id: @bs_or_pl_category
    end

    assert_redirected_to bs_or_pl_categories_path
  end
end
