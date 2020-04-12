class CreateCookingProductRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_product_relations do |t|
      t.references :cooking, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
