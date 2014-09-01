# == Schema Information
#
# Table name: phone_numbers
#
#  id             :integer          not null, primary key
#  number         :string(255)
#  number_type    :string(255)
#  phoneable_id   :integer
#  phoneable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class PhoneNumber < ActiveRecord::Base
  belongs_to :phoneable, polymorphic: true

  #validates :phoneable_id, presence: true
  #validates :phoneable_type, presence: true
  validates :number, numericality: true
end
