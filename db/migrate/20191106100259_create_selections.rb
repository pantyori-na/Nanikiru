class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :post_image_id
      t.string :name

      t.timestamps
    end
  end
end
