class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:preview, :show, :edit, :update, :destroy]
  layout 'preview', only: :preview

  # GET /medicines
  # GET /medicines.json
  def index
    @medicines = Medicine.all
  end

  # GET /medicines/1
  # GET /medicines/1.json
  def show
  end

  # GET /medicines/new
  def new
    @medicine = Medicine.new
    @medicine_type = MedicineType.all
  end

  # GET /medicines/1/edit
  def edit
    @medicine_type = MedicineType.all
  end

  # POST /medicines
  # POST /medicines.json
  def create
    @medicine = Medicine.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @medicine, notice: 'Medicine was successfully created.' }
        format.json { render :show, status: :created, location: @medicine }
      else
        @medicine_type = MedicineType.all
        format.html { render :new }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicines/1
  # PATCH/PUT /medicines/1.json
  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to @medicine, notice: 'Medicine was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicine }
      else
        format.html { render :edit }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to medicines_url, notice: 'Medicine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /medicines/1
  def preview
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = Medicine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicine_params
      params.require(:medicine).permit(:name, :medicine_type_id, :purpose, :make, :manufacturer, :distributor, :approving_agency, :classification_type_1, :classification_type_2, :other_specifications, :form, :potency, :first_packing_unit_qty, :second_packing_unit_qty, :third_packing_unit_qty, :storage_instructions, :expiry_duration_months, :medication_type)
    end
end
