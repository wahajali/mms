# == Schema Information
#
# Table name: previous_illnesses
#
#  id         :integer          not null, primary key
#  disease_id :integer
#  patient_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class PreviousIllness < ActiveRecord::Base
  belongs_to :patient, inverse_of: :previous_illnesses
  belongs_to :disease, inverse_of: :previous_illnesses
end
