# == Schema Information
#
# Table name: income_sub_categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  income_category_id :integer
#

require 'test_helper'

class IncomeSubCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
