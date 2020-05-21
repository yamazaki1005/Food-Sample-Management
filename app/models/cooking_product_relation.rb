class CookingProductRelation < ApplicationRecord
  belongs_to :cooking, optional: true
  belongs_to :product, optional: true
end
