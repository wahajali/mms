# == Schema Information
#
# Table name: family_histories
#
#  id         :integer          not null, primary key
#  disease_id :integer
#  patient_id :integer
#  relation   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FamilyHistory < ActiveRecord::Base
  belongs_to :patient, inverse_of: :family_histories
  belongs_to :disease, inverse_of: :family_histories
end
