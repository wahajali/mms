class ManufacturingsController < ApplicationController
  before_action :set_manufacturing, only: [:show, :edit, :update, :destroy]

  # GET /manufacturings
  # GET /manufacturings.json
  def index
    @manufacturings = Manufacturing.all
  end

  # GET /manufacturings/1
  # GET /manufacturings/1.json
  def show
  end

  # GET /manufacturings/new
  def new
    @manufacturing = Manufacturing.new
    @address = @manufacturing.build_address
    @phone_numbers = @manufacturing.phone_numbers.build
    @common_data = @manufacturing.build_common_data
    @center_types = CenterType.all
  end

  # GET /manufacturings/1/edit
  def edit
    @address = @manufacturing.address
    @phone_numbers = @manufacturing.phone_numbers
    @common_data = @manufacturing.common_data
    @center_types = CenterType.all
  end

  # POST /manufacturings
  # POST /manufacturings.json
  def create
    @manufacturing = Manufacturing.new(manufacturing_params)
    @address = @manufacturing.address
    @phone_numbers = @manufacturing.phone_numbers
    @common_data = @manufacturing.common_data
    @center_types = CenterType.all

    respond_to do |format|
      if @manufacturing.save
        format.html { redirect_to @manufacturing, notice: 'Manufacturing was successfully created.' }
        format.json { render :show, status: :created, location: @manufacturing }
      else
        format.html { render :new }
        format.json { render json: @manufacturing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturings/1
  # PATCH/PUT /manufacturings/1.json
  def update
    respond_to do |format|
      if @manufacturing.update(manufacturing_params)
        format.html { redirect_to @manufacturing, notice: 'Manufacturing was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturing }
      else
        @address = @manufacturing.address
        @phone_numbers = @manufacturing.phone_numbers
        @common_data = @manufacturing.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @manufacturing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturings/1
  # DELETE /manufacturings/1.json
  def destroy
    @manufacturing.destroy
    respond_to do |format|
      format.html { redirect_to manufacturings_url, notice: 'Manufacturing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_manufacturing
    @manufacturing = Manufacturing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def manufacturing_params
   params.require(:manufacturing).permit(address_attributes: [:line1, :line2, :city, :zip_code],  common_data_attributes: [:contact_person, :center_type_id, :legal_entity, :ownership, :assets_value, :facilities_details, :operating_since, :operating_business, :liabilities, :manpower_strength, :manpower_details], phone_numbers_attributes: [:number, :number_type])
  end
end
