require 'test_helper'

class BsOrPlSubCategoriesControllerTest < ActionController::TestCase
  setup do
    @bs_or_pl_sub_category = bs_or_pl_sub_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bs_or_pl_sub_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bs_or_pl_sub_category" do
    assert_difference('BsOrPlSubCategory.count') do
      post :create, bs_or_pl_sub_category: { bs_or_pl_category_id: @bs_or_pl_sub_category.bs_or_pl_category_id, name: @bs_or_pl_sub_category.name }
    end

    assert_redirected_to bs_or_pl_sub_category_path(assigns(:bs_or_pl_sub_category))
  end

  test "should show bs_or_pl_sub_category" do
    get :show, id: @bs_or_pl_sub_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bs_or_pl_sub_category
    assert_response :success
  end

  test "should update bs_or_pl_sub_category" do
    patch :update, id: @bs_or_pl_sub_category, bs_or_pl_sub_category: { bs_or_pl_category_id: @bs_or_pl_sub_category.bs_or_pl_category_id, name: @bs_or_pl_sub_category.name }
    assert_redirected_to bs_or_pl_sub_category_path(assigns(:bs_or_pl_sub_category))
  end

  test "should destroy bs_or_pl_sub_category" do
    assert_difference('BsOrPlSubCategory.count', -1) do
      delete :destroy, id: @bs_or_pl_sub_category
    end

    assert_redirected_to bs_or_pl_sub_categories_path
  end
end
