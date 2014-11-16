# == Schema Information
#
# Table name: income_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class IncomeCategory < ActiveRecord::Base
  has_many :incomes, dependent: :restrict_with_error
  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: true
end
