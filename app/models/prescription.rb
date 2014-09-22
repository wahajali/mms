# == Schema Information
#
# Table name: prescriptions
#
#  id                :integer          not null, primary key
#  medicine_id       :integer
#  patient_record_id :integer
#  dosage            :string(255)
#  notes             :text
#  created_at        :datetime
#  updated_at        :datetime
#

class Prescription < ActiveRecord::Base
  belongs_to :medicine, inverse_of: :prescription
  belongs_to :patient_record, inverse_of: :prescription
end
