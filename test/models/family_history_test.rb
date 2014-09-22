# == Schema Information
#
# Table name: family_histories
#
#  id         :integer          not null, primary key
#  disease_id :integer
#  patient_id :integer
#  relation   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class FamilyHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
