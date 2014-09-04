class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: [:show, :edit, :update, :destroy]

  # GET /pharmacies
  # GET /pharmacies.json
  def index
    @pharmacies = Pharmacy.all
  end

  # GET /pharmacies/1
  # GET /pharmacies/1.json
  def show
  end

  # GET /pharmacies/new
  def new
    @pharmacy = Pharmacy.new
    @address = @pharmacy.build_address
    @phone_numbers = @pharmacy.phone_numbers.build
    @common_data = @pharmacy.build_common_data
    @center_types = CenterType.all
  end

  # GET /pharmacies/1/edit
  def edit
    @address = @pharmacy.address
    @phone_numbers = @pharmacy.phone_numbers
    @common_data = @pharmacy.common_data
    @center_types = CenterType.all
  end

  # POST /pharmacies
  # POST /pharmacies.json
  def create
    @pharmacy = Pharmacy.new(pharmacy_params)
    @address = @pharmacy.address
    @phone_numbers = @pharmacy.phone_numbers
    @common_data = @pharmacy.common_data
    @center_types = CenterType.all

    respond_to do |format|
      if @pharmacy.save
        format.html { redirect_to @pharmacy, notice: 'Pharmacy was successfully created.' }
        format.json { render :show, status: :created, location: @pharmacy }
      else
        format.html { render :new }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacies/1
  # PATCH/PUT /pharmacies/1.json
  def update
    respond_to do |format|
      if @pharmacy.update(pharmacy_params)
        format.html { redirect_to @pharmacy, notice: 'Pharmacy was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmacy }
      else
        @address = @pharmacy.address
        @phone_numbers = @pharmacy.phone_numbers
        @common_data = @pharmacy.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacies/1
  # DELETE /pharmacies/1.json
  def destroy
    @pharmacy.destroy
    respond_to do |format|
      format.html { redirect_to pharmacies_url, notice: 'Pharmacy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pharmacy_params
    params.require(:pharmacy).permit(address_attributes: [:line1, :line2, :city, :zip_code],  common_data_attributes: CommonData.permitted_attributes, phone_numbers_attributes: [:number, :number_type])
  end
end
