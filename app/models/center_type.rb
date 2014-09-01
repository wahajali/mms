# == Schema Information
#
# Table name: center_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CenterType < ActiveRecord::Base
    validates :name, presence: true

    has_many :common_datas
end
