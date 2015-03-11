# == Schema Information
#
# Table name: stock_items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  manufacturer :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class StockItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
