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
#  investigation_and_report       :text
#  additional_notes               :text
#

require 'test_helper'

class PatientRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
