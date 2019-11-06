class CreateSiteReports < ActiveRecord::Migration[5.2]
  def change
    create_table :site_reports do |t|
      t.text :comment
      t.integer :type

      t.timestamps
    end
  end
end
