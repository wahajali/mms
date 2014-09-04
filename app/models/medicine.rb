# == Schema Information
#
# Table name: medicines
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  medicine_type_id        :integer
#  purpose                 :string(255)
#  make                    :string(255)
#  manufacturer            :string(255)
#  distributor             :string(255)
#  approving_agency        :string(255)
#  classification_type_1   :string(255)
#  classification_type_2   :string(255)
#  other_specifications    :text
#  form                    :string(255)
#  potency                 :string(255)
#  first_packing_unit_qty  :integer
#  second_packing_unit_qty :integer
#  third_packing_unit_qty  :integer
#  storage_instructions    :text
#  expiry_duration_months  :integer
#  created_at              :datetime
#  updated_at              :datetime
#

class Medicine < ActiveRecord::Base
  belongs_to :medicine_type

  validates :name, presence: true
end
