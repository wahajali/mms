class TradingsController < ApplicationController
  before_action :set_trading, only: [:show, :edit, :update, :destroy]

  # GET /tradings
  # GET /tradings.json
  def index
    @tradings = Trading.all
  end

  # GET /tradings/1
  # GET /tradings/1.json
  def show
  end

  # GET /tradings/new
  def new
    @trading = Trading.new
    @address = @trading.build_address
    @phone_numbers = @trading.phone_numbers.build
    @common_data = @trading.build_common_data
    @center_types = CenterType.all
  end

  # GET /tradings/1/edit
  def edit
    @address = @trading.address
    @phone_numbers = @trading.phone_numbers
    @common_data = @trading.common_data
    @center_types = CenterType.all
  end

  # POST /tradings
  # POST /tradings.json
  def create
    @trading = Trading.new(trading_params)

    respond_to do |format|
      if @trading.save
        format.html { redirect_to @trading, notice: 'Trading was successfully created.' }
        format.json { render :show, status: :created, location: @trading }
      else
        @address = @trading.address
        @phone_numbers = @trading.phone_numbers
        @common_data = @trading.common_data
        @center_types = CenterType.all
        format.html { render :new }
        format.json { render json: @trading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tradings/1
  # PATCH/PUT /tradings/1.json
  def update
    respond_to do |format|
      if @trading.update(trading_params)
        format.html { redirect_to @trading, notice: 'Trading was successfully updated.' }
        format.json { render :show, status: :ok, location: @trading }
      else
        @address = @trading.address
        @phone_numbers = @trading.phone_numbers
        @common_data = @trading.common_data
        @center_types = CenterType.all
        format.html { render :edit }
        format.json { render json: @trading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tradings/1
  # DELETE /tradings/1.json
  def destroy
    @trading.destroy
    respond_to do |format|
      format.html { redirect_to tradings_url, notice: 'Trading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_trading
    @trading = Trading.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trading_params
    params.require(:trading).permit(address_attributes: [:line1, :line2, :city, :zip_code],  common_data_attributes: [:contact_person, :center_type_id, :legal_entity, :ownership, :assets_value, :facilities_details, :operating_since, :operating_business, :liabilities, :manpower_strength, :manpower_details], phone_numbers_attributes: [:number, :number_type])
  end
end
