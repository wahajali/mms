# == Schema Information
#
# Table name: progresses
#
#  id                :integer          not null, primary key
#  progressable_type :string(255)
#  progressable_id   :integer
#  percentage        :integer
#  progress_date     :date
#  created_at        :datetime
#  updated_at        :datetime
#  additional_note   :text
#

class Progress < ActiveRecord::Base
  belongs_to :progressable, polymorphic: true
end
