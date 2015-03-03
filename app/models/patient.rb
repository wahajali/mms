# == Schema Information
#
# Table name: patients
#
#  id                         :integer          not null, primary key
#  card_no                    :string(255)
#  card_date                  :date
#  first_name                 :string(255)
#  last_name                  :string(255)
#  fathers_name               :string(255)
#  mothers_name               :string(255)
#  husbands_name              :string(255)
#  dob                        :date
#  referred_by                :string(255)
#  gender                     :string(255)
#  marital_status             :string(255)
#  blood_group                :string(255)
#  patient_type               :string(255)
#  financial_type             :string(255)
#  treatment_type             :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  family_history_description :text
#  additional_notes           :text
#  mobile_number              :string(255)
#  landline                   :text
#

class Patient < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :patient_records

  has_many :family_histories
  has_many :family_history_diseases, through: :family_histories, source: :disease

  has_many :previous_illnesses
  has_many :previous_diseases, through: :previous_illnesses, source: :disease
  #has_many :treatments, through: :previous_illnesses TODO
  
  has_many :diagnosed_main_diseases
  has_many :main_diseases, through: :diagnosed_main_diseases, source: :disease
  
  has_many :diagnosed_associated_diseases
  has_many :associated_diseases, through: :diagnosed_associated_diseases, source: :disease

  has_many :legacy_cards

  validates :first_name, :last_name, :mobile_number, presence: true, allow_blank: false
  validates :mobile_number, uniqueness: true

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :previous_illnesses
  accepts_nested_attributes_for :previous_diseases
  accepts_nested_attributes_for :family_histories
  accepts_nested_attributes_for :family_history_diseases
  accepts_nested_attributes_for :legacy_cards
  accepts_nested_attributes_for :diagnosed_main_diseases, allow_destroy: true
  accepts_nested_attributes_for :main_diseases
  accepts_nested_attributes_for :diagnosed_associated_diseases, allow_destroy: true
  accepts_nested_attributes_for :associated_diseases

  def name
    first_name + ' ' + last_name
  end
end
