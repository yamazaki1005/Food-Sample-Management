# frozen_string_literal: true

# home controller
class HomesController < ApplicationController
  before_action :set_all_cooking_categories, only: %i[index show]

  def index
    @cooking_category_various = Cooking.find(5,6,17,26,34,38,41,56)
    # 最終的に料理分類ごとに見栄えがいいものを１種類ずつ選んで表示する
  end
end
