# == Schema Information
#
# Table name: stocks
#
#  id                   :integer          not null, primary key
#  medicine_id          :integer
#  purchase_date        :date
#  purchase_qty         :integer
#  purchase_details     :text
#  purchase_price       :float
#  expiry               :date
#  present_stock        :integer
#  created_at           :datetime
#  updated_at           :datetime
#  cost_centerable_id   :integer
#  cost_centerable_type :string(255)
#  business_category_id :integer
#  user_id              :integer
#

class Stock < ActiveRecord::Base
  belongs_to :medicine
  belongs_to :cost_centerable, polymorphic: true
  belongs_to :business_category
  belongs_to :user

  validates :medicine_id, :purchase_qty, :cost_centerable_id, :cost_centerable_type, :business_category_id, presence: true
end
