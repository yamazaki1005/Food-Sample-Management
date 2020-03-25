# frozen_string_literal: true

# app_whole_manage_due_to_class
class ApplicationController < ActionController::Base
  helper_method :current_user
  # before_action :set_locale
  protect_from_forgery with: :exception
  before_action :set_search_query


  private

  def set_search_query
    @q = current_user.products.ransack(params[:q]) if session[:user_id]
    @products = @q.result(products_number: true) if session[:user_id]
  end

  # def show_custom_error_page(error)
  #   @error = error
  #   render :custom_error
  # end
end
