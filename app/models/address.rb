# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  line1            :string(255)
#  line2            :string(255)
#  city             :string(255)
#  zip_code         :string(255)
#  addressable_id   :integer
#  addressable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :line1, presence: true
  validates :city, presence: true
  #validates :addressable_id, presence: true
  #validates :addressable_type, presence: true
  #
  
  def get_address
    "#{line1} #{line2} #{city}".strip
  end 
end
