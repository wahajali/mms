# == Schema Information
#
# Table name: expenses
#
#  id                      :integer          not null, primary key
#  date                    :date
#  expense_category_id     :integer
#  receipient              :string(255)
#  expense_type_id         :integer
#  amount                  :float
#  created_at              :datetime
#  updated_at              :datetime
#  cost_centerable_id      :integer
#  cost_centerable_type    :string(255)
#  expense_sub_category_id :integer
#  bal_sheet_or_pl         :string(255)
#  bs_or_pl_category_id    :integer
#

class Expense < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :expense_sub_category
  belongs_to :expense_type
  belongs_to :bs_or_pl_category
  belongs_to :cost_centerable, polymorphic: true
  
  validates :amount, :date, :bal_sheet_or_pl, presence: true, allow_blank: false
end
