# == Schema Information
#
# Table name: bs_or_pl_sub_categories
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  bs_or_pl_category_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class BsOrPlSubCategory < ActiveRecord::Base
  has_many :expense
  has_many :incomes
  belongs_to :bs_or_pl_category
  before_destroy :check_associations

  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true

  def check_associations
    if self.expenses.present? || self.incomes.present?
      errors.add_to_base "There are associated expenses or incomes with this Balance Sheet or Profit and Loss sub-category"
      return false
    end
    return true
  end
end
