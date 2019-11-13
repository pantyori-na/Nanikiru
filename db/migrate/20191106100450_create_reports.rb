class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.text :comment
      t.integer :report_type,default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
