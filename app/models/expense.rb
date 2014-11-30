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
  
  validates :amount, :date, :bal_sheet_or_pl, :expense_category, :business_category, :cost_centerable, presence: true, allow_blank: false

  #TODO add validation that bs_or_pl_sub_category is infact a subcategory of bs_or_pl_category
end
