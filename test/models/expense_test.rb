# == Schema Information
#
# Table name: expenses
#
#  id                   :integer          not null, primary key
#  date                 :date
#  expense_category_id  :integer
#  receipient           :string(255)
#  expense_type_id      :integer
#  amount               :float
#  created_at           :datetime
#  updated_at           :datetime
#  cost_centerable_id   :integer
#  cost_centerable_type :integer
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
