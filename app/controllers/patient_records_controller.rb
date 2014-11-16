class PatientRecordsController < ApplicationController
  before_action :set_patient_record, only: [:show, :edit, :update, :destroy]

  # GET /patient_records
  # GET /patient_records.json
  def index
    @patient_records = PatientRecord.all
  end

  # GET /patient_records/1
  # GET /patient_records/1.json
  def show
    @patient = Patient.find(params['patient_id'])
  end

  # GET /patient_records/new
  def new
    @patient = Patient.find(params['patient_id'])
    @patient_record = @patient.patient_records.build
    get_meds
  end

  # GET /patient_records/1/edit
  def edit
    @patient = Patient.find(params['patient_id'])
    get_meds
  end

  # POST /patient_records
  # POST /patient_records.json
  def create
    @patient = Patient.find(params[:patient_id])
    @patient_record = PatientRecord.new(patient_record_params)
    binding.pry

    respond_to do |format|
      if @patient_record.save
        format.html { redirect_to patient_patient_record_path(@patient, @patient_record), notice: 'Patient record was successfully created.' }
        format.json { render :show, status: :created, location: @patient_record }
      else
        get_meds
        format.html { render :new }
        format.json { render json: @patient_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_records/1
  # PATCH/PUT /patient_records/1.json
  def update
    @patient = Patient.find(params[:patient_id])
    binding.pry
    respond_to do |format|
      if @patient_record.update(patient_record_params)
        format.html { redirect_to [@patient, @patient_record], notice: 'Patient record was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_record }
      else
        get_meds
        format.html { render :edit }
        format.json { render json: @patient_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_records/1
  # DELETE /patient_records/1.json
  def destroy
    @patient = Patient.find(params['patient_id'])
    @patient_record.destroy
    respond_to do |format|
      format.html { redirect_to @patient, notice: 'Patient record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_record
      @patient_record = PatientRecord.find(params[:id])
    end

    def get_meds
      @medicines = Medicine.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_record_params
      params.require(:patient_record).permit(:patient_id, :visit_date_islamic, :visit_date_english, :visit_day, :doctor_id, :handling_person, :checked_weight, :checked_height, :checked_bp, :no_of_children, :youngest_child_age, :lscs, :diabetic_history, :present_complaint, :conducted_physical_examination, :disease_id, :investigation_and_report, prescriptions_attributes: [:id, :medicine_id, :dosage, :notes, :_destroy])
    end
end
