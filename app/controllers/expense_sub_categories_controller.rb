class ExpenseSubCategoriesController < ApplicationController
  before_action :set_expense_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /expense_sub_categories
  # GET /expense_sub_categories.json
  def index
    @expense_sub_categories = ExpenseSubCategory.all
  end

  # GET /expense_sub_categories/1
  # GET /expense_sub_categories/1.json
  def show
  end

  # GET /expense_sub_categories/new
  def new
    @expense_sub_category = ExpenseSubCategory.new
  end

  # GET /expense_sub_categories/1/edit
  def edit
  end

  # POST /expense_sub_categories
  # POST /expense_sub_categories.json
  def create
    @expense_sub_category = ExpenseSubCategory.new(expense_sub_category_params)

    respond_to do |format|
      if @expense_sub_category.save
        format.html { redirect_to @expense_sub_category, notice: 'Expense sub category was successfully created.' }
        format.json { render :show, status: :created, location: @expense_sub_category }
      else
        format.html { render :new }
        format.json { render json: @expense_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_sub_categories/1
  # PATCH/PUT /expense_sub_categories/1.json
  def update
    respond_to do |format|
      if @expense_sub_category.update(expense_sub_category_params)
        format.html { redirect_to @expense_sub_category, notice: 'Expense sub category was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_sub_category }
      else
        format.html { render :edit }
        format.json { render json: @expense_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_sub_categories/1
  # DELETE /expense_sub_categories/1.json
  def destroy
    @expense_sub_category.destroy
    respond_to do |format|
      format.html { redirect_to expense_sub_categories_url, notice: 'Expense sub category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_sub_category
      @expense_sub_category = ExpenseSubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_sub_category_params
      params.require(:expense_sub_category).permit(:name)
    end
end
