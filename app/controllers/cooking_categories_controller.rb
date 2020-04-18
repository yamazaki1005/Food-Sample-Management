class CookingCategoriesController < ApplicationController
  before_action :set_cooking_category, only: %i[show]

  def index
    @cooking_categories = CookingCategory.all
  end

  def show

  end

  private

  def set_cooking_category
    @cooking_category = CookingCategory.find(params[:id])
  end
end
