# == Schema Information
#
# Table name: business_categories
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  business_centerable_type :string(255)
#  business_centerable_id   :integer
#  created_at               :datetime
#  updated_at               :datetime
#

require 'test_helper'

class BusinessCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
