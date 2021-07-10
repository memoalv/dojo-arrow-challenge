class ModifyUserColumnsOnArrows < ActiveRecord::Migration[6.1]
  def change
    rename_column :arrows, :user_id, :received_by_user_id
    rename_column :arrows, :sent_by_id, :sent_by_user_id
  end
end
