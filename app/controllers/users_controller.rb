class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_all_cooking_categories, only: %i[index show]
  before_action :set_user, only: %i[show]

  def index
    @users = User.all
  end

  def show
    @mycookings = Cooking.where(user_id: params[:id])
  end
end
