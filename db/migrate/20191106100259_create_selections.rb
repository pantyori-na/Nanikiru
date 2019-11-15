class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :post_image_id
      t.integer :name,default: 18, null: true, limit: 1
      t.timestamps
    end
  end
end
