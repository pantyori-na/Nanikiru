class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :selection_id
      t.text :comment

      t.timestamps
    end
  end
end
