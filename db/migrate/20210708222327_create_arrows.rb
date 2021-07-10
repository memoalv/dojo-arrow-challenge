class CreateArrows < ActiveRecord::Migration[6.1]
  def change
    create_table :arrows do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
