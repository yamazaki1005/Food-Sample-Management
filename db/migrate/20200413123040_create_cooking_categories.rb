class CreateCookingCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_categories do |t|
      t.string :classification_name

      t.timestamps
    end
  end
end
