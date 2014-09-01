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

require 'test_helper'

class CommonDataTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
