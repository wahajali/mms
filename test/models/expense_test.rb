# == Schema Information
#
# Table name: expenses
#
#  id                       :integer          not null, primary key
#  date                     :date
#  expense_category_id      :integer
#  receipient               :string(255)
#  expense_type_id          :integer
#  amount                   :float
#  created_at               :datetime
#  updated_at               :datetime
#  cost_centerable_id       :integer
#  cost_centerable_type     :string(255)
#  expense_sub_category_id  :integer
#  bal_sheet_or_pl          :string(255)
#  bs_or_pl_category_id     :integer
#  voucher_or_ref_details   :text
#  unique_identifier        :string(255)
#  business_category_id     :integer
#  bs_or_pl_sub_category_id :integer
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
