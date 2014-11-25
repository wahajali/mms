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
#

class LegacyCard < ActiveRecord::Base
  has_attached_file :card, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :card, :content_type => /\Aimage\/.*\Z/
end
