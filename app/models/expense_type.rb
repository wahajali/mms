# == Schema Information
#
# Table name: expense_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ExpenseType < ActiveRecord::Base
  has_many :expenses
  validates :name, presence: true, allow_blank: false
end
