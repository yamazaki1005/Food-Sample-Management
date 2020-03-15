# frozen_string_literal: true

# products chage
class ChangeProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :category, foreign_key: true
    add_index :products, :product_name, :unique => true
  end
end
