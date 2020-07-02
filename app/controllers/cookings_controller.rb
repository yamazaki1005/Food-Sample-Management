# frozen_string_literal: true

#cooking_management
class CookingsController < ApplicationController
  before_action :set_cooking, only: %i[show edit update destroy]
  before_action :set_products, only: %i[new create edit update]
  before_action :set_product_categories, only: %i[new create edit update]
  before_action :set_filter_product_categories, only: %i[new create edit update]
  before_action :set_cooking_categories, only: %i[new create edit update]
  before_action :set_all_cooking_categories, only: %i[index show]
  before_action :set_user, only: %i[index show]
  before_action :authenticate_user!, only: %i[new create edit update]
  # CSRFトークン検証をスキップする
  skip_before_action :verify_authenticity_token
  PER = 12

  def index
    @cookings_page = Cooking.page(params[:page]).per(PER)
  end

  def show; end

  def new
    @cooking = Cooking.new
    @cooking.cooking_product_relations.build
  end

  def foodstuff
    @foodstuff = Product.where(product_category_id: params[:product_category_id])
  end

  def edit
    if @cooking.user != current_user && !current_user.admin?
      redirect_to root_path, notice: t('msg.Do_not_edit_posts')
    end
  end

  def update
    begin
      @cooking.update!(cooking_params)
      redirect_to cookings_url, notice: t('msg.update', name: t('cooking', name: @cooking.cooking_name))
    rescue ActiveRecord::RecordInvalid
      render :edit
    rescue
      @cooking.errors.add(:base, t('msg.error_information', name: @cooking.cooking_name))
      render :edit
    end
  end

  def create
    begin
      @cooking = Cooking.new(cooking_params)
      @cooking.user_id = current_user.id
      @cooking.save!
      redirect_to user_path(@cooking.user_id), notice: t('msg.create', name: t('cooking', name: @cooking.cooking_name))
    rescue ActiveRecord::RecordInvalid => e
      pp e.record.errors
      render :new
    rescue
      render :new
    end
  end

  def destroy
    @cooking.destroy
    redirect_to cookings_url, notice: t('msg.delete', name: t('cooking', name: @cooking.cooking_name))
  end

  private

  def cooking_params
    params.require(:cooking).permit(:cooking_name, :cooking_category_id, :product_category_id, :user_id, :image, :created_at, :updated_at, { product_ids: [] }, :remark)
  end

  def set_cooking
    @cooking = Cooking.find(params[:id])
  end
end
