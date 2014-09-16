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
  has_many :patient_records

  has_many :family_histories
  has_many :family_history_diseases, through: :family_histories, source: :disease

  has_many :previous_illnesses
  has_many :previous_diseases, through: :previous_illnesses, source: :disease
  #has_many :treatments, through: :previous_illnesses TODO

  validates :first_name, :last_name, presence: true, allow_blank: false

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
  accepts_nested_attributes_for :family_histories
  accepts_nested_attributes_for :previous_illnesses
  accepts_nested_attributes_for :previous_diseases
  accepts_nested_attributes_for :family_history_diseases

  def name
    first_name + ' ' + last_name
  end
end
