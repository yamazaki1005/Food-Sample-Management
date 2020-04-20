class AddColumnAndRenameCookingCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :cooking_categories, :classification_reference_name, :string
  end
end
