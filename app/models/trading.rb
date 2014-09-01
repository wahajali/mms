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

  validates :address, presence: true
  validates :common_data, presence: true

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :common_data, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
end
