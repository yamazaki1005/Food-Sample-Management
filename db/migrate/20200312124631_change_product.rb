# frozen_string_literal: true

# products chage
class ChangeProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :classification, :string
    add_column :products, :classification_ID, :integer, null: true
    add_index :products, :product_name, :unique => true
  end
end
