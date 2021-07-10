class FinalRenameUserColumnsOnArrows < ActiveRecord::Migration[6.1]
  def change
    rename_column :arrows, :received_by_user_id, :to_user_id
    rename_column :arrows, :sent_by_user_id, :from_user_id
  end
end
