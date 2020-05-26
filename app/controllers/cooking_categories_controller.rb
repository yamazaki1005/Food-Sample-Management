class CookingCategoriesController < ApplicationController
  before_action :set_cooking_category, only: %i[show]
  before_action :set_all_cooking_categories, only: %i[index show]

  def index; end

  def show; end

  private

  def set_cooking_category
    @cooking_category = CookingCategory.find(params[:id])
  end
end
