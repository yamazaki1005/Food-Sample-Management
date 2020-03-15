# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  validates :product_name, length: { maximum: 30 }
  belongs_to :category
end
