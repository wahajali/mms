# == Schema Information
#
# Table name: expense_sub_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ExpenseSubCategory < ActiveRecord::Base
  has_many :expenses, dependent: :restrict_with_error
  has_and_belongs_to_many :expense_categories, join_table: 'expense_categories_expense_sub_categories'
  accepts_nested_attributes_for :expense_categories
  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true
  validate :check_association, :before => :save
  validate :check_num_associated, :before => :save

  def check_association
    if !self.expense_categories.any?
      errors.add(:expense_sub_category, "must have at least one parent category")
      return false
    end
    return true
  end

  def check_num_associated
    expenses = Expense.where(expense_sub_category_id: self.id, expense_category_id: self.expense_categories.map(&:id)).map(&:id)
    expenses_sub = self.expenses.map(&:id)
    if expenses.uniq.sort == expenses_sub.uniq.sort
      return true
    else 
      errors.add(:expense_sub_category, "contains expenses that belong to both the expense sub category and parent category that has been removed. Previous update is not possible.")
      return false
    end
  end

end
