class AddColumnToCooking < ActiveRecord::Migration[6.0]
  def change
    add_column :cookings, :cooking_category_id, :bigint
    add_column :products, :cooking_category_id, :bigint
  end
end
