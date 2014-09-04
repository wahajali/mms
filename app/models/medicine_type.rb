# == Schema Information
#
# Table name: medicine_types
#
#  id            :integer          not null, primary key
#  medicine_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class MedicineType < ActiveRecord::Base
  has_many :medicines
end
