# == Schema Information
#
# Table name: bs_or_pl_sub_categories
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  bs_or_pl_category_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class BsOrPlSubCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
