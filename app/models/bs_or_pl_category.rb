# == Schema Information
#
# Table name: bs_or_pl_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  bl_or_pl   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BsOrPlCategory < ActiveRecord::Base
  has_many :expense
  has_many :incomes

  validates :name, :bl_or_pl, presence: true, allow_blank: false
  validates :name, uniqueness: true

  def get_name
    if bl_or_pl == 'Balance Sheet'
      return 'balance-sheet'
    else 
      return 'profit-loss'
    end
  end

  def self.bs_categories
    self.where('bl_or_pl = ?', 'Balance Sheet')
  end

  def self.pl_categories
    self.where('bl_or_pl = Balance Sheet')
  end
end
