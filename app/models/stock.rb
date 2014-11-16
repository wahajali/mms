# == Schema Information
#
# Table name: stocks
#
#  id               :integer          not null, primary key
#  medicine_id      :integer
#  purchase_date    :date
#  purchase_qty     :integer
#  purchase_details :text
#  purchase_price   :float
#  expiry           :date
#  present_stock    :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Stock < ActiveRecord::Base
  belongs_to :medicine

  validates :medicine_id, :purchase_qty, presence: true
end
