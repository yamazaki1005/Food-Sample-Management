# frozen_string_literal: true

# Category
class Category < ApplicationRecord
  has_many :classification_name
end
