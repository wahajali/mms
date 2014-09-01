class InstitutesController < ApplicationController
  before_action :set_institute, only: [:show, :edit, :update, :destroy]

  # GET /institutes
  # GET /institutes.json
  def index
    @institutes = Institute.all
  end

  # GET /institutes/1
  # GET /institutes/1.json
  def show
  end

  # GET /institutes/new
  def new
    @institute = Institute.new
    @address = @institute.build_address
    @phone_numbers = @institute.phone_numbers.build
    @common_data = @institute.build_common_data
    @center_types = CenterType.all
  end

  # GET /institutes/1/edit
  def edit
    @address = @institute.address
    @phone_numbers = @institute.phone_numbers
    @common_data = @institute.common_data
    @center_types = CenterType.all
  end

  # POST /institutes
  # POST /institutes.json
  def create
    @institute = Institute.new(institute_params)
    @address = @institute.address
    @phone_numbers = @institute.phone_numbers
    @common_data = @institute.common_data
    @center_types = CenterType.all

    respond_to do |format|
      if @institute.save
        format.html { redirect_to @institute, notice: 'Institute was successfully created.' }
        format.json { render :show, status: :created, location: @institute }
      else
        format.html { render :new }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutes/1
  # PATCH/PUT /institutes/1.json
  def update
    respond_to do |format|
      if @institute.update(institute_params)
        format.html { redirect_to @institute, notice: 'Institute was successfully updated.' }
        format.json { render :show, status: :ok, location: @institute }
      else
        @address = @institute.address
        @phone_numbers = @institute.phone_numbers
        @common_data = @institute.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutes/1
  # DELETE /institutes/1.json
  def destroy
    @institute.destroy
    respond_to do |format|
      format.html { redirect_to institutes_url, notice: 'Institute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_institute
    @institute = Institute.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def institute_params
    params.require(:institute).permit(address_attributes: [:line1, :line2, :city, :zip_code],  common_data_attributes: [:contact_person, :center_type_id, :legal_entity, :ownership, :assets_value, :facilities_details, :operating_since, :operating_business, :liabilities, :manpower_strength, :manpower_details], phone_numbers_attributes: [:number, :number_type])
  end
end
