class CorporatesController < ApplicationController
  before_action :set_corporate, only: [:show, :edit, :update, :destroy]

  # GET /corporates
  # GET /corporates.json
  def index
    @corporates = Corporate.all
  end

  # GET /corporates/1
  # GET /corporates/1.json
  def show
  end

  # GET /corporates/new
  def new
    @corporate = Corporate.new
    @address = @corporate.build_address
    @phone_numbers = @corporate.phone_numbers.build
    @common_data = @corporate.build_common_data
    @center_types = CenterType.all
  end

  # GET /corporates/1/edit
  def edit
    @address = @corporate.address
    @phone_numbers = @corporate.phone_numbers
    @common_data = @corporate.common_data
    @center_types = CenterType.all
  end

  # POST /corporates
  # POST /corporates.json
  def create
    @corporate = Corporate.new(corporate_params)
    @address = @corporate.address
    @phone_numbers = @corporate.phone_numbers
    @common_data = @corporate.common_data
    @center_types = CenterType.all

    respond_to do |format|
      if @corporate.save
        format.html { redirect_to @corporate, notice: 'Corporate was successfully created.' }
        format.json { render :show, status: :created, location: @corporate }
      else
        format.html { render :new }
        format.json { render json: @corporate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corporates/1
  # PATCH/PUT /corporates/1.json
  def update
    respond_to do |format|
      if @corporate.update(corporate_params)
        format.html { redirect_to @corporate, notice: 'Corporate was successfully updated.' }
        format.json { render :show, status: :ok, location: @corporate }
      else
        @address = @corporate.address
        @phone_numbers = @corporate.phone_numbers
        @common_data = @corporate.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @corporate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corporates/1
  # DELETE /corporates/1.json
  def destroy
    @corporate.destroy
    respond_to do |format|
      format.html { redirect_to corporates_url, notice: 'Corporate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_corporate
    @corporate = Corporate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def corporate_params
    params.require(:corporate).permit(address_attributes: [:line1, :line2, :city, :zip_code], common_data_attributes: CommonData.permitted_attributes, phone_numbers_attributes: [:number, :number_type])
  end
end
