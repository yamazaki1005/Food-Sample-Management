# frozen_string_literal: true

class Product < ApplicationRecord
  validates :product_name, length: { maximum: 30 }
end
