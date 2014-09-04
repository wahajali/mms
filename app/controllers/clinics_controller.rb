class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  # GET /clinics
  # GET /clinics.json
  def index
    @clinics = Clinic.all
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
    @address = @clinic.build_address
    @phone_numbers = @clinic.phone_numbers.build
    @common_data = @clinic.build_common_data
    @center_types = CenterType.all
  end

  # GET /clinics/1/edit
  def edit
    @address = @clinic.address
    @phone_numbers = @clinic.phone_numbers
    @common_data = @clinic.common_data
    @center_types = CenterType.all
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)
    @address = @clinic.address
    @phone_numbers = @clinic.phone_numbers
    @common_data = @clinic.common_data
    @center_types = CenterType.all

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, notice: 'Clinic was successfully created.' }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1
  # PATCH/PUT /clinics/1.json
  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to @clinic, notice: 'Clinic was successfully updated.' }
        format.json { render :show, status: :ok, location: @clinic }
      else
        @address = @clinic.address
        @phone_numbers = @clinic.phone_numbers
        @common_data = @clinic.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic.destroy
    respond_to do |format|
      format.html { redirect_to clinics_url, notice: 'Clinic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def clinic_params
    params.require(:clinic).permit(address_attributes: [:line1, :line2, :city, :zip_code], common_data_attributes: CommonData.permitted_attributes, phone_numbers_attributes: [:number, :number_type])
  end
end
