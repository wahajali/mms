class RemoveColumnProgressFromDiagnosedAssociatedDiseases < ActiveRecord::Migration
  def change
    remove_column :diagnosed_associated_diseases, :progress
    remove_column :diagnosed_main_diseases, :progress
  end
end
