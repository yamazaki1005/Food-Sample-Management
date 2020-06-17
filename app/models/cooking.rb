# frozen_string_literal: true

# Cooking
class Cooking < ApplicationRecord

  has_many :cooking_product_relations, dependent: :destroy
  has_many :products, through: :cooking_product_relations
  has_one_attached :image
  belongs_to :product_category
  belongs_to :cooking_category
  belongs_to :user

  def product_by?(cooking)
    cooking_product_relations.where(cooking_id: cooking.id).exists?
  end
end
