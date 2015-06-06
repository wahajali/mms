# == Schema Information
#
# Table name: expense_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ExpenseCategory < ActiveRecord::Base
  has_many :expenses, dependent: :restrict_with_error
  #has_many :expense_sub_categories, dependent: :restrict_with_error
  has_and_belongs_to_many :expense_sub_categories, join_table: 'expense_categories_expense_sub_categories'
  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true
end
