# == Schema Information
#
# Table name: diseases
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Disease < ActiveRecord::Base
  has_many :family_histories, inverse_of: :disease
  has_many :family_history_patients, through: :family_histories, source: :patient

  has_many :previous_illnesses, inverse_of: :disease
  has_many :previous_illness_patients, through: :previous_illnesses, source: :patient

  validates :name, presence: true, allow_blank: false, uniqueness: true
end
