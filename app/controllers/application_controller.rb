# frozen_string_literal: true

# app_whole_manage_due_to_class
class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :set_search_query

  private

  def set_product_categories
    @product_categories = ProductCategory.all.map{|n| [n.classification_name, n.id]}
  end

  def set_cooking_categories
    @cooking_categories = CookingCategory.all.map{|n| [n.classification_name, n.id]}
  end

  def set_all_cooking_categories
    @all_cooking_categories = CookingCategory.all
  end

  def set_search_query
    @q = current_user.products.ransack(params[:q]) if session[:user_id]
    @products = @q.result(products_number: true) if session[:user_id]
  end

  def set_cookings
    @cookings = Cooking.all
  end

  def set_products
    @products = Product.all
  end

  def set_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
end
