class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.string :name
      t.text :description
      t.float :unit_price
      t.integer :quantity
      t.references :line_item_date, null: false, foreign_key: true

      t.timestamps
    end
  end
end
