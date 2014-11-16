class BusinessCategoriesController < ApplicationController
  before_action :set_business_category, only: [:show, :edit, :update, :destroy]

  # GET /business_categories
  # GET /business_categories.json
  def index
    @business_categories = BusinessCategory.all
  end

  # GET /business_categories/1
  # GET /business_categories/1.json
  def show
  end

  # GET /business_categories/new
  def new
    @business_category = BusinessCategory.new
  end

  # GET /business_categories/get_categories
  def get_categories
    val = params[:value].split(';')
    @business_categories = val.first.constantize.find(val.last).business_categories
    respond_to do |format|
      format.js
    end
  end

  # GET /business_categories/1/edit
  def edit
  end

  # POST /business_categories
  # POST /business_categories.json
  def create
    business_category_params["business_centerable_type"] = business_category_params["business_centerable_id"].split(';').first
    business_category_params["business_centerable_id"] = business_category_params["business_centerable_id"].split(';').last
    @business_category = BusinessCategory.new(business_category_params)

    respond_to do |format|
      if @business_category.save
        format.html { redirect_to @business_category, notice: 'Business category was successfully created.' }
        format.json { render :show, status: :created, location: @business_category }
      else
        format.html { render :new }
        format.json { render json: @business_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_categories/1
  # PATCH/PUT /business_categories/1.json
  def update
    respond_to do |format|
      if @business_category.update(business_category_params)
        format.html { redirect_to @business_category, notice: 'Business category was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_category }
      else
        format.html { render :edit }
        format.json { render json: @business_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_categories/1
  # DELETE /business_categories/1.json
  def destroy
    @business_category.destroy
    respond_to do |format|
      format.html { redirect_to business_categories_url, notice: 'Business category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_business_category
    @business_category = BusinessCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def business_category_params
    params.require(:business_category).permit!
    #params.require(:business_category).permit(:name, :business_centerable_type, :business_centerable_id)
  end
end
