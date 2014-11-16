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

class Income < ActiveRecord::Base
  belongs_to :income_category
  belongs_to :income_sub_category
  belongs_to :income_type
  belongs_to :bs_or_pl_category
  belongs_to :cost_centerable, polymorphic: true
  
  validates :amount, :date, presence: true, allow_blank: false
end
