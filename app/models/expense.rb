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

class Expense < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :expense_type
  belongs_to :cost_centerable, polymorphic: true
  
  validates :amount, :date, presence: true, allow_blank: false
end
