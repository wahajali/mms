# == Schema Information
#
# Table name: patients
#
#  id             :integer          not null, primary key
#  card_no        :string(255)
#  card_date      :date
#  first_name     :string(255)
#  last_name      :string(255)
#  fathers_name   :string(255)
#  mothers_name   :string(255)
#  husbands_name  :string(255)
#  dob            :date
#  referred_by    :string(255)
#  gender         :string(255)
#  marital_status :string(255)
#  blood_group    :string(255)
#  patient_type   :string(255)
#  financial_type :string(255)
#  treatment_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
