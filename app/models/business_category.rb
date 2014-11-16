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

  validates :name, presence: true, allow_blank: false
end
