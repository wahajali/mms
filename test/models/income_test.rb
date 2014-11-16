# == Schema Information
#
# Table name: incomes
#
#  id                     :integer          not null, primary key
#  date                   :date
#  income_category_id     :integer
#  income_sub_category_id :integer
#  income_type_id         :integer
#  benefactor             :string(255)
#  amount                 :float
#  cost_centerable_id     :integer
#  cost_centerable_type   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  bs_or_pl_category_id   :integer
#  bal_sheet_or_pl        :string(255)
#

require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
