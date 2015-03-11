# == Schema Information
#
# Table name: income_sub_categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  income_category_id :integer
#

class IncomeSubCategory < ActiveRecord::Base
  has_many :incomes, dependent: :restrict_with_error
  belongs_to :income_category
  validates :name, :income_category_id, presence: true, allow_blank: false
  validates :name, uniqueness: true
end
