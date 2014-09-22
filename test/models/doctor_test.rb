# == Schema Information
#
# Table name: doctors
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  qualification :text
#  notes         :text
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
