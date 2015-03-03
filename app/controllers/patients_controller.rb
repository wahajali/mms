class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :add_legacy_card, :edit_legacy_card, :add_associated_disease_form, :add_main_disease_form, :update_associated_disease_form, :update_main_disease_form, :update_diseases, :update_associated_disease, :update_main_disease]

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
  end

  # GET /patients/1/edit
  def edit
    @address = @patient.address
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

  def update_associated_disease_form
    @disease = @patient.associated_diseases.find(params[:disease_id])
    @diagnosed_disease = @patient.diagnosed_associated_diseases.find_by_disease_id(params[:disease_id])
    respond_to do |format|
      format.js
    end
  end

  def update_associated_disease
    params.require(:patient).permit!
    @patient.diagnosed_associated_diseases.find_by_disease_id(params[:disease_id]).progresses.build(params[:patient][:diagnosed_associated_disease][:progress]).save
    respond_to do |format|
      format.js
    end
  end
  
  def update_main_disease_form
  end
  
  def update_main_disease
  end

  def add_associated_disease_form
    diseases  = @patient.associated_diseases.map(&:id).uniq
    @diseases = Disease.all.reject{ |a| diseases.include?(a.id) }
    @associated_disease = @patient.diagnosed_associated_diseases.build
    respond_to do |format|
      format.js
    end
  end

  def add_main_disease_form
    diseases  = @patient.main_diseases.map(&:id).uniq
    @diseases = Disease.all.reject{ |a| diseases.include?(a.id) }
    @main_disease = @patient.diagnosed_main_diseases.build
    respond_to do |format|
      format.js
    end
  end

  # GET
  # use this to get patient record form
      #post 'add_associated_disease'
      #post 'add_main_disease'
  def patient_record_form
    get_diseases
    respond_to do |format|
      #format.html { redirect_to patients_url, notice: 'Patient was successfully updated.' }
      format.js
    end
  end

  # POST
  # use this to create patient record
  def update_diseases
    if params[:patient][:diagnosed_associated_diseases_attributes].present?
      params[:patient][:diagnosed_associated_diseases_attributes].select{ |k, v| v["_destroy"] == "false" }.each do |k, v| 
        @patient.diagnosed_associated_diseases.build(disease_id: v[:disease_id]).progresses.build(percentage: v[:progress][:percentage], progress_date: v[:progress][:progress_date], additional_note: v[:progress][:additional_note])
      end
    end
    if params[:patient][:diagnosed_main_diseases_attributes].present?
      params[:patient][:diagnosed_main_diseases_attributes].select{ |k, v| v["_destroy"] == "false" }.each do |k, v| 
        @patient.diagnosed_main_diseases.build(disease_id: v[:disease_id]).progresses.build(percentage: v[:progress][:percentage], progress_date: v[:progress][:progress_date], additional_note: v[:progress][:additional_note])
      end
    end

    #TODO instead of redirect, do render.
    respond_to do |format|
      if @patient.save
        format.html { redirect_to patients_url, notice: 'Patient was successfully updated.' }
        format.js
      else
        format.html { redirect_to patients_url, notice: 'Patient was successfully updated.' }
        format.js
      end
    end
  end

  # POST
  def add_legacy_card
    @patient.legacy_cards.build(patient_params['appointment_cards'])
    respond_to do |format|
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
