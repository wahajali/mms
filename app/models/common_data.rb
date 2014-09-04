# == Schema Information
#
# Table name: common_data
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  contact_person     :string(255)
#  legal_entity       :string(255)
#  ownership          :string(255)
#  assets_value       :float
#  facilities_details :text
#  operating_since    :date
#  operating_business :text
#  liabilities        :string(255)
#  manpower_strength  :integer
#  manpower_details   :text
#  center_type_id     :integer
#  entity_id          :integer
#  entity_type        :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class CommonData < ActiveRecord::Base
  belongs_to :center_type
  belongs_to :entity, polymorphic: true

  validates :contact_person, :name, presence: true
  #validates :entity_id, presence: true
  #validates :entity_type, presence: true
  validates :assets_value, numericality: true, allow_blank: true
  validates :manpower_strength, numericality: { only_integer: true }, allow_blank: true

  def self.permitted_attributes
    return [:name, :contact_person, :center_type_id, :legal_entity, :ownership, :assets_value, :facilities_details, :operating_since, :operating_business, :liabilities, :manpower_strength, :manpower_details]
  end
end
