class IncomeSubCategoriesController < ApplicationController
  before_action :set_income_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /income_sub_categories
  # GET /income_sub_categories.json
  def index
    @income_sub_categories = IncomeSubCategory.all
  end

  # GET /income_sub_categories/1
  # GET /income_sub_categories/1.json
  def show
  end

  # GET /income_sub_categories/new
  def new
    @income_sub_category = IncomeSubCategory.new
    @income_categories = IncomeCategory.all
  end

  # GET /income_sub_categories/1/edit
  def edit
    @income_categories = IncomeCategory.all
  end

  # POST /income_sub_categories
  # POST /income_sub_categories.json
  def create
    @income_sub_category = IncomeSubCategory.new(income_sub_category_params)

    respond_to do |format|
      if @income_sub_category.save
        format.html { redirect_to @income_sub_category, notice: 'Income sub category was successfully created.' }
        format.json { render :show, status: :created, location: @income_sub_category }
      else
        @income_categories = IncomeCategory.all
        format.html { render :new }
        format.json { render json: @income_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_sub_categories/1
  # PATCH/PUT /income_sub_categories/1.json
  def update
    respond_to do |format|
      if @income_sub_category.update(income_sub_category_params)
        format.html { redirect_to @income_sub_category, notice: 'Income sub category was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_sub_category }
      else
        @income_categories = IncomeCategory.all
        format.html { render :edit }
        format.json { render json: @income_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_sub_categories/1
  # DELETE /income_sub_categories/1.json
  def destroy
    @income_sub_category.destroy
    respond_to do |format|
      if @income_sub_category.errors.any?
        format.html { redirect_to income_sub_categories_url, alert: @income_sub_category.errors.full_messages.first }
        format.json { head :no_content }
      else
        format.html { redirect_to income_sub_categories_url, notice: 'Income sub category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_sub_category
      @income_sub_category = IncomeSubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_sub_category_params
      params.require(:income_sub_category).permit!
    end
end
