# frozen_string_literal: true

# cooking_category
class CookingCategory < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :cookings, dependent: :destroy
end
