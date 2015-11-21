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

class Expense < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :expense_sub_category
  belongs_to :expense_type
  belongs_to :bs_or_pl_category
  belongs_to :bs_or_pl_sub_category
  belongs_to :cost_centerable, polymorphic: true
  belongs_to :business_category
  
  validates :expense_type, :amount, :date, :bal_sheet_or_pl, :expense_category, :business_category, :cost_centerable, presence: true, allow_blank: false

  #TODO add validation that bs_or_pl_sub_category is infact a subcategory of bs_or_pl_category
  def self.get_expenses(args)
    expenses = Expense.where('date >= ?', args[:from])
    expenses = expenses.where('date <= ?', args[:to])
    expenses = expenses.where('cost_centerable_id', args[:cost_center_id]) if args[:cost_centerable_id]
    expenses = expenses.where('cost_centerable_type', args[:cost_center_type]) if args[:cost_centerable_type]
    expenses = expenses.where('expense_category_id', args[:ec]) if args[:ec]
    expenses = expenses.where('expense_sub_category_id', args[:esc]) if args[:esc]
    expenses = expenses.where('expense_type', args[:et]) if args[:et]
    expenses = expenses.where('expense_type', args[:receipient]) if args[:receipient]
    @expenses = Expense.where('(date >= ? AND date <= ?) AND cost_centerable_id = ? AND cost_centerable_type = ? AND expense_category_id = ?', @from, @to, @cost_center.id, @cost_center.class.to_s, params[:ec]).order('date DESC')
  end
end
