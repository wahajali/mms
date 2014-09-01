# == Schema Information
#
# Table name: phone_numbers
#
#  id             :integer          not null, primary key
#  number         :string(255)
#  number_type    :string(255)
#  phoneable_id   :integer
#  phoneable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
