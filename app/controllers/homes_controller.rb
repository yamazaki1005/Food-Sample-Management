# frozen_string_literal: true

# home controller
class HomesController < ApplicationController
  before_action :set_all_cooking_categories, only: %i[index show]

  def index
    @cooking_category_various = Cooking.find(5,43,26,34)
    # トップ画面に表示する料理をIDで４つ選んで表示
  end
end
