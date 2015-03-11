class StocksController < ApplicationController
  before_action :set_medicine, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = @medicine.stocks
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    binding.pry
    stock_params["cost_centerable_type"] = stock_params["cost_centerable_id"].split(';').first
    stock_params["cost_centerable_id"] = stock_params["cost_centerable_id"].split(';').last
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to medicine_stock_path(@stock.medicine, @stock), notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        @stock.reload
        @medicine = @stock.medicine
        format.html { redirect_to medicine_stock_url(@medicine, @stock), notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to medicine_stocks_url(@medicine), notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = @medicine.stocks.find(params[:id])
    end

    def set_medicine
      @medicine = Medicine.find(params[:medicine_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit!
      #params.require(:stock).permit(:medicine_id, :purchase_date, :purchase_qty, :purchase_details, :purchase_price, :expiry, :present_stock)
    end
end
