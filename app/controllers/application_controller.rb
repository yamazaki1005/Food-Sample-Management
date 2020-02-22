# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :set_current_user
  helper_method :current_user
  # before_action :login_required
  # before_action :set_locale
  # rescue_form MyCustomError, with: show_custom_error_page
  protect_from_forgery with: :exception
  before_action :set_search_query

  private

  # ログイン機能実装の段階で、メソッドを消してもcurrent_userが取ってこれるか確認する。
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    # redirect_to new_user_session_path unless user_signed_in?
  end

  def set_search_query
    @q = current_user.products.ransack(params[:q]) if session[:user_id]
    @products = @q.result(products_number: true) if session[:user_id]
  end

  def show_custom_error_page(error)
    @error = error
    render :custom_error
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user.nil?
      flash[:notice] = 'ログインが必要です'
      redirect_to('/user_session_path')
    end
  end

  def forbid_login_user
    flash[:notice] = 'すでにログインしています' if @current_user
  end
end
