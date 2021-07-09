class AddForeignKeyToSentByUserIdOnArrows < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :arrows, :users, column: "sent_by_user_id"
  end
end
