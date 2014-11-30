class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :add_legacy_card, :edit_legacy_card, :patient_record_form, :update_diseases]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient_records = @patient.patient_records
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @address = @patient.build_address
    @diseases = Disease.all
    @patient.family_histories.build
    @patient.previous_illnesses.build
    @phone_numbers = @patient.phone_numbers.build
  end

  # GET /patients/1/edit
  def edit
    @address = @patient.address
    @phone_numbers = @patient.phone_numbers
    @diseases = Disease.all
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        @address = @patient.address
        @phone_numbers = @patient.phone_numbers
        @diseases = Disease.all
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        @address = @patient.address
        @phone_numbers = @patient.phone_numbers
        @diseases = Disease.all
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # GET
  # use this to get patient record form
  def patient_record_form
    get_diseases
  end

  # POST
  # use this to create patient record
  def update_diseases
    binding.pry
=begin
    if params[:patient][:diagnosed_associated_diseases_attributes].any?
      params[:patient][:diagnosed_associated_diseases_attributes].each do |k, v|
        @patient.diagnosed_associated_diseases.create(disease_id: v[:disease_id], progress: v[:progress])
      end
    end

    if params[:patient][:diagnosed_main_diseases_attributes].any?
      params[:patient][:diagnosed_main_diseases_attributes].each do |k, v|
        @patient.diagnosed_main_diseases.create(disease_id: v[:disease_id], progress: v[:progress])
      end
    end
=end 
    #TODO instead of redirect, do render.
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # POST
  def add_legacy_card
    respond_to do |format|
      @patient.legacy_cards.build(patient_params['appointment_cards'])
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        @card = @patient.legacy_cards.select(&:new_record?).first
        format.html { render :edit_legacy_card }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET
  def edit_legacy_card
    @card = @patient.legacy_cards.build
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def get_diseases
    @diseases = Disease.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit!
    #params.require(:patient).permit(:card_no, :card_date, :first_name, :last_name, :fathers_name, :mothers_name, :husbands_name, :dob, :referred_by, :gender, :marital_status, :blood_group, :patient_type, :financial_type, :treatment_type, phone_numbers_attributes: [:number, :number_type], address_attributes: [:line1, :line2, :city, :zip_code], family_history_disease_ids: [], previous_disease_ids: [])
  end
end
