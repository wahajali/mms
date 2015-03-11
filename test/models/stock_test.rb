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
#

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
