# frozen_string_literal: true

# Cooking
class Cooking < ApplicationRecord
  validates :cooking_name,
            presence: true,
            length: { maximum: 30 },
            uniqueness: true

  has_many :cooking_product_relations, dependent: :destroy
  has_many :products, through: :cooking_product_relations
  has_one_attached :image
  belongs_to :product_category

  def product_by?(cooking)
    cooking_product_relations.where(cooking_id: cooking.id).exists?
  end
end
