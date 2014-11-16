# == Schema Information
#
# Table name: tradings
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Trading < ActiveRecord::Base
  has_one :address, as: :addressable
  has_one :common_data, as: :entity
  has_many :phone_numbers, as: :phoneable
  has_many :expenses, as: :cost_centerable
  has_many :business_categories, as: :business_centerable

  validates :address, presence: true
  validates :common_data, presence: true

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :common_data, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  def name
    "#{self.class.name} - #{common_data.name}"
  end

  def value
    "#{self.class.name};#{id}"
  end
end
