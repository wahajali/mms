class LaboratoriesController < ApplicationController
  before_action :set_laboratory, only: [:show, :edit, :update, :destroy]

  # GET /laboratories
  # GET /laboratories.json
  def index
    @laboratories = Laboratory.all
  end

  # GET /laboratories/1
  # GET /laboratories/1.json
  def show
  end

  # GET /laboratories/new
  def new
    @laboratory = Laboratory.new
    @address = @laboratory.build_address
    @phone_numbers = @laboratory.phone_numbers.build
    @common_data = @laboratory.build_common_data
    @center_types = CenterType.all
  end

  # GET /laboratories/1/edit
  def edit
    @address = @laborator.address
    @phone_numbers = @laborator.phone_numbers
    @common_data = @laborator.common_data
    @center_types = CenterType.all
  end

  # POST /laboratories
  # POST /laboratories.json
  def create
    @laboratory = Laboratory.new(laboratory_params)
    @address = @laborator.address
    @phone_numbers = @laborator.phone_numbers
    @common_data = @laborator.common_data
    @center_types = CenterType.all

    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully created.' }
        format.json { render :show, status: :created, location: @laboratory }
      else
        format.html { render :new }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratories/1
  # PATCH/PUT /laboratories/1.json
  def update
    respond_to do |format|
      if @laboratory.update(laboratory_params)
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully updated.' }
        format.json { render :show, status: :ok, location: @laboratory }
      else
        @address = @laborator.address
        @phone_numbers = @laborator.phone_numbers
        @common_data = @laborator.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratories/1
  # DELETE /laboratories/1.json
  def destroy
    @laboratory.destroy
    respond_to do |format|
      format.html { redirect_to laboratories_url, notice: 'Laboratory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_laboratory
    @laboratory = Laboratory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def laboratory_params
    params.require(:laborator).permit(address_attributes: [:line1, :line2, :city, :zip_code],  common_data_attributes: [:contact_person, :center_type_id, :legal_entity, :ownership, :assets_value, :facilities_details, :operating_since, :operating_business, :liabilities, :manpower_strength, :manpower_details], phone_numbers_attributes: [:number, :number_type])
  end
end
