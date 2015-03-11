# == Schema Information
#
# Table name: expense_sub_categories
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  expense_category_id :integer
#

require 'test_helper'

class ExpenseSubCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
