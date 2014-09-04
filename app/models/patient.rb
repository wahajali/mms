# == Schema Information
#
# Table name: patients
#
#  id             :integer          not null, primary key
#  card_no        :string(255)
#  card_date      :date
#  first_name     :string(255)
#  last_name      :string(255)
#  fathers_name   :string(255)
#  mothers_name   :string(255)
#  husbands_name  :string(255)
#  dob            :date
#  referred_by    :string(255)
#  gender         :string(255)
#  marital_status :string(255)
#  blood_group    :string(255)
#  patient_type   :string(255)
#  financial_type :string(255)
#  treatment_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Patient < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :phone_numbers, as: :phoneable

  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  def name
    first_name + ' ' + last_name
  end
end
