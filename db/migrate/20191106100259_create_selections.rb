class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :post_image_id
      t.integer :name,default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
