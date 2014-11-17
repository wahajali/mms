class BsOrPlSubCategoriesController < ApplicationController
  before_action :set_bs_or_pl_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /bs_or_pl_sub_categories
  # GET /bs_or_pl_sub_categories.json
  def index
    @bs_or_pl_sub_categories = BsOrPlSubCategory.all
  end

  # GET /bs_or_pl_sub_categories/1
  # GET /bs_or_pl_sub_categories/1.json
  def show
  end

  # GET /bs_or_pl_sub_categories/new
  def new
    @bs_or_pl_sub_category = BsOrPlSubCategory.new
  end

  # GET /bs_or_pl_sub_categories/1/edit
  def edit
  end

  # POST /bs_or_pl_sub_categories
  # POST /bs_or_pl_sub_categories.json
  def create
    @bs_or_pl_sub_category = BsOrPlSubCategory.new(bs_or_pl_sub_category_params)

    respond_to do |format|
      if @bs_or_pl_sub_category.save
        format.html { redirect_to @bs_or_pl_sub_category, notice: 'Bs or pl sub category was successfully created.' }
        format.json { render :show, status: :created, location: @bs_or_pl_sub_category }
      else
        format.html { render :new }
        format.json { render json: @bs_or_pl_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bs_or_pl_sub_categories/1
  # PATCH/PUT /bs_or_pl_sub_categories/1.json
  def update
    respond_to do |format|
      if @bs_or_pl_sub_category.update(bs_or_pl_sub_category_params)
        format.html { redirect_to @bs_or_pl_sub_category, notice: 'Bs or pl sub category was successfully updated.' }
        format.json { render :show, status: :ok, location: @bs_or_pl_sub_category }
      else
        format.html { render :edit }
        format.json { render json: @bs_or_pl_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bs_or_pl_sub_categories/1
  # DELETE /bs_or_pl_sub_categories/1.json
  def destroy
    @bs_or_pl_sub_category.destroy
    respond_to do |format|
      format.html { redirect_to bs_or_pl_sub_categories_url, notice: 'Bs or pl sub category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bs_or_pl_sub_category
      @bs_or_pl_sub_category = BsOrPlSubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bs_or_pl_sub_category_params
      params.require(:bs_or_pl_sub_category).permit(:name, :bs_or_pl_category_id)
    end
end
