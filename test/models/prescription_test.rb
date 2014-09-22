# == Schema Information
#
# Table name: prescriptions
#
#  id                :integer          not null, primary key
#  medicine_id       :integer
#  patient_record_id :integer
#  dosage            :string(255)
#  notes             :text
#  created_at        :datetime
#  updated_at        :datetime
#

require 'test_helper'

class PrescriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
