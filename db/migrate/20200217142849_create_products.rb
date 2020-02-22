class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :product_number
      t.integer :page
      t.integer :classification
      t.boolean :discontinued
      t.string :unit_name
      t.integer :price
      t.text :remark
      t.integer :unit
      t.integer :user_id

      t.timestamps
    end
  end
end
