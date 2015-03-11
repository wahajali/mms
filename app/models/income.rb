# == Schema Information
#
# Table name: incomes
#
#  id                       :integer          not null, primary key
#  date                     :date
#  income_category_id       :integer
#  income_sub_category_id   :integer
#  income_type_id           :integer
#  benefactor               :string(255)
#  amount                   :float
#  cost_centerable_id       :integer
#  cost_centerable_type     :string(255)
#  created_at               :datetime
#  updated_at               :datetime
#  bs_or_pl_category_id     :integer
#  bal_sheet_or_pl          :string(255)
#  voucher_or_ref_details   :text
#  unique_identifier        :string(255)
#  business_category_id     :integer
#  bs_or_pl_sub_category_id :integer
#

class Income < ActiveRecord::Base
  belongs_to :income_category
  belongs_to :income_sub_category
  belongs_to :income_type
  belongs_to :bs_or_pl_category
  belongs_to :bs_or_pl_sub_category
  belongs_to :cost_centerable, polymorphic: true
  belongs_to :business_category
  
  validates :amount, :unique_identifier, :date, :bal_sheet_or_pl, :income_category, :business_category, :cost_centerable, presence: true, allow_blank: false
end
