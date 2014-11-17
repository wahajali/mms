# == Schema Information
#
# Table name: business_categories
#
#  id                       :integer          not null, primary key
#  name                     :string(255)
#  business_centerable_type :string(255)
#  business_centerable_id   :integer
#  created_at               :datetime
#  updated_at               :datetime
#

class BusinessCategory < ActiveRecord::Base
  belongs_to :business_centerable, polymorphic: true
  has_many :expenses
  has_many :incomes

  before_destroy :no_related_business_centers

  validates :name, presence: true, allow_blank: false

  def no_related_business_centers
    if self.expenses.present? || self.incomes.present?
      errors.add_to_base "There are associated expenses or incomes with this business category"
      return false
    end
    return true
  end
end
