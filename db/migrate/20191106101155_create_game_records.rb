class CreateGameRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :game_records do |t|
      t.integer :user_id
      t.string :handle_name
      t.integer :game_type,default: 0, null: false, limit: 1
      t.integer :ability
      t.integer :game_name

      t.timestamps
    end
  end
end
