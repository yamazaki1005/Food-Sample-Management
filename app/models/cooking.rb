class Cooking < ApplicationRecord
  has_many :cooking_product_relations, dependent: :destroy
  has_many :products, through: :cooking_product_relations
end
