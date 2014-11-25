class AddAttachmentCardToLegacyCards < ActiveRecord::Migration
  def self.up
    change_table :legacy_cards do |t|
      t.attachment :card
    end
  end

  def self.down
    remove_attachment :legacy_cards, :card
  end
end
