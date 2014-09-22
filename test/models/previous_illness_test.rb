# == Schema Information
#
# Table name: previous_illnesses
#
#  id         :integer          not null, primary key
#  disease_id :integer
#  patient_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PreviousIllnessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
