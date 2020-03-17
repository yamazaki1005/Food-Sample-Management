# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  validates :product_name,
            presence: true,
            length: { maximum: 30 },
            uniqueness: true

  validates :product_number,
            presence: true,
            numericality: { only_integer: true },
            length: { maximum: 10 },
            uniqueness: true

  validates :page,
           numericality: { only_integer: true }

  validates :discontinued,
            inclusion: { in: [true, false] }

  validates :unit_name,
            presence: true

  validates :price,
            numericality: { only_integer: true }

  validates :unit,
            presence: true,
            numericality: { only_integer: true }
  belongs_to :category
  has_one_attached :image
end
