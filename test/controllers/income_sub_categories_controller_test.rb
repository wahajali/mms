require 'test_helper'

class IncomeSubCategoriesControllerTest < ActionController::TestCase
  setup do
    @income_sub_category = income_sub_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_sub_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_sub_category" do
    assert_difference('IncomeSubCategory.count') do
      post :create, income_sub_category: { name: @income_sub_category.name }
    end

    assert_redirected_to income_sub_category_path(assigns(:income_sub_category))
  end

  test "should show income_sub_category" do
    get :show, id: @income_sub_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_sub_category
    assert_response :success
  end

  test "should update income_sub_category" do
    patch :update, id: @income_sub_category, income_sub_category: { name: @income_sub_category.name }
    assert_redirected_to income_sub_category_path(assigns(:income_sub_category))
  end

  test "should destroy income_sub_category" do
    assert_difference('IncomeSubCategory.count', -1) do
      delete :destroy, id: @income_sub_category
    end

    assert_redirected_to income_sub_categories_path
  end
end
