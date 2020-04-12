# frozen_string_literal: true

# Category
class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :cookings, dependent: :destroy
end
