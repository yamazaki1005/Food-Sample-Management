class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all_cooking_categories, only: %i[index show]
  before_action :set_user, only: %i[show]
  PER = 12

  def index
    @users = User.all
  end

  def show
    # @mycookings = Cooking.where(user_id: params[:id])
    @mycookings = Cooking.where(user_id: params[:id]).page(params[:page]).per(PER)
  end
end
