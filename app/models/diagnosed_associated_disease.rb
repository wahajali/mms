# == Schema Information
#
# Table name: diagnosed_associated_diseases
#
#  id         :integer          not null, primary key
#  disease_id :integer
#  patient_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class DiagnosedAssociatedDisease < ActiveRecord::Base
  #TODO make combination of disease_id and patient_id unique
  belongs_to :patient, inverse_of: :diagnosed_associated_diseases
  belongs_to :disease, inverse_of: :diagnosed_associated_diseases
  has_many :progresses, as: :progressable

  validates_uniqueness_of :disease_id, :scope => [:patient_id], message: 'Only one instance of the Associated Disease can exist for the patient.'
  
  accepts_nested_attributes_for :progresses
end
