# == Schema Information
#
# Table name: legacy_cards
#
#  id                :integer          not null, primary key
#  patient_id        :integer
#  created_at        :datetime
#  updated_at        :datetime
#  card_file_name    :string(255)
#  card_content_type :string(255)
#  card_file_size    :integer
#  card_updated_at   :datetime
#  appointment_date  :date
#  name              :string(255)
#

class LegacyCard < ActiveRecord::Base
  has_attached_file :card
  validates_attachment :card, content_type: { content_type: "application/pdf" }
end
