# == Schema Information
#
# Table name: patient_records
#
#  id                             :integer          not null, primary key
#  patient_id                     :integer
#  visit_date_islamic             :date
#  visit_date_english             :date
#  visit_day                      :string(255)
#  doctor_id                      :integer
#  handling_person                :string(255)
#  checked_weight                 :float
#  checked_height                 :float
#  checked_bp                     :float
#  no_of_children                 :integer
#  youngest_child_age             :integer
#  lscs                           :string(255)
#  diabetic_history               :text
#  present_complaint              :text
#  conducted_physical_examination :text
#  created_at                     :datetime
#  updated_at                     :datetime
#  disease_id                     :integer
#  investigation_and_report       :text
#

class PatientRecord < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :disease

  has_many :prescriptions
  has_many :medicines, through: :prescriptions

  accepts_nested_attributes_for :prescriptions
  accepts_nested_attributes_for :medicines

end
