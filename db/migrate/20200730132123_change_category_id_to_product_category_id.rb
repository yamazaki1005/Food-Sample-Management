class ChangeCategoryIdToProductCategoryId < ActiveRecord::Migration[6.0]
  def change
    rename_column :cookings, :category_id, :product_category_id
    # rename_column :products, :category_id, :product_category_id
  end
end
