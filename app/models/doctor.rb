# == Schema Information
#
# Table name: doctors
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  qualification :text
#  notes         :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Doctor < ActiveRecord::Base
end
