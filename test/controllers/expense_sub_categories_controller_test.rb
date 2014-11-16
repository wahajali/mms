require 'test_helper'

class ExpenseSubCategoriesControllerTest < ActionController::TestCase
  setup do
    @expense_sub_category = expense_sub_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_sub_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_sub_category" do
    assert_difference('ExpenseSubCategory.count') do
      post :create, expense_sub_category: { name: @expense_sub_category.name }
    end

    assert_redirected_to expense_sub_category_path(assigns(:expense_sub_category))
  end

  test "should show expense_sub_category" do
    get :show, id: @expense_sub_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense_sub_category
    assert_response :success
  end

  test "should update expense_sub_category" do
    patch :update, id: @expense_sub_category, expense_sub_category: { name: @expense_sub_category.name }
    assert_redirected_to expense_sub_category_path(assigns(:expense_sub_category))
  end

  test "should destroy expense_sub_category" do
    assert_difference('ExpenseSubCategory.count', -1) do
      delete :destroy, id: @expense_sub_category
    end

    assert_redirected_to expense_sub_categories_path
  end
end
