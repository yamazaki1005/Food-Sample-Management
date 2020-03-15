# frozen_string_literal: true

# Category
class Category < ApplicationRecord
  has_many :products, dependent: :destroy
end
