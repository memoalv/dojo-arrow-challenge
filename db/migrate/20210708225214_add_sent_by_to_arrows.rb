class AddSentByToArrows < ActiveRecord::Migration[6.1]
  def change
    add_reference :arrows, :sent_by, references: :users, index: true
  end
end
