# frozen_string_literal: true

#cooking_management
class CookingsController < ApplicationController
  before_action :set_cooking, only: %i[show edit update destroy]
  before_action :set_products, only: %i[new create edit update]
  before_action :set_product_categories, only: %i[new create edit update]
  before_action :set_cooking_categories, only: %i[new create edit update]
  # CSRFトークン検証をスキップする
  skip_before_action :verify_authenticity_token

  def index
    @cookings = Cooking.all
  end

  def show; end

  def new
    @cooking = Cooking.new
    @cooking.cooking_product_relations.build
  end

  def edit; end

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
    @cooking = Cooking.new(cooking_params)
    if @cooking.valid?
      @cooking.save
      redirect_to cookings_url, notice: t('msg.create', name: t('cooking', name: @cooking.cooking_name))
    else
      render :new
    end
  end

  def destroy
    @cooking.destroy
    redirect_to cookings_url, notice: t('msg.delete', name: t('cooking', name: @cooking.cooking_name))
  end

  private

  def cooking_params
    params.require(:cooking).permit(:cooking_name, :cooking_category_id, :product_category_id, :user_id, :image, :created_at, :updated_at, { :product_ids=> [] }, :image)
  end

  def set_cooking
    @cooking = Cooking.find(params[:id])
  end

  def set_products
    @products = Product.all
  end
end
