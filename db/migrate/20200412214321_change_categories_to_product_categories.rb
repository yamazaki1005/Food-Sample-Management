class ChangeCategoriesToProductCategories < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories, :product_categories
  end
end
