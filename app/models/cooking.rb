class Cooking < ApplicationRecord
  has_many :cooking_product_relations, dependent: :destroy
  has_many :products, through: :cooking_product_relations
  has_one_attached :image
  belongs_to :category

  def product_by?(cooking)
    cooking_product_relations.where(cooking_id: cooking.id).exists?
  end
end
