# == Schema Information
#
# Table name: income_categories_income_sub_categories
#
#  id                     :integer          not null, primary key
#  income_category_id     :integer
#  income_sub_category_id :integer
#  created_at             :datetime
#  updated_at             :datetime
#

class IncomeCategoriesIncomeSubCategories < ActiveRecord::Base
end
