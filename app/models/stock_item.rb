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

class StockItem < ActiveRecord::Base
end
