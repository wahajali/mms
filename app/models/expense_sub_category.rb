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

class ExpenseSubCategory < ActiveRecord::Base
  has_many :expenses, dependent: :restrict_with_error
  belongs_to :expense_category
  validates :name, :expense_category_id, presence: true, allow_blank: false
  validates :name, uniqueness: true
end
