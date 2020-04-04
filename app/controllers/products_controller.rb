# frozen_string_literal: true

# products controller
class ProductsController < ApplicationController
  # CSRFトークン検証をスキップする
  skip_before_action :verify_authenticity_token
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  PAGE_LIMIT_NUMBER = 30

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to products_path, notice: t('msg.create', v: t('product', name: @product.product_name))
    else
      render :new
    end
  end

  def update
    begin
      @product.update!(product_params)
      redirect_to products_url, notice: t('msg.update', name: t('product', name: @product.product_name))
    rescue ActiveRecord::RecordInvalid
      render :edit
    rescue
      @product.errors.add(:base, t('msg.error_information', name: @product.product_name))
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: t('msg.delete', name: t('product', name: @product.product_name))
  end

  #   def self.ransackable_attributes(auth_object = nil)
  #     %w[product_name product_number page classification discontinued price created_at updated_at]
  #   end
  #
  #   def self.ransackable_associations(auth_object = nil)
  #     []
  #   end
  #
  #   def detailed_list
  #     @products = Product.ransack(params[:q]).result(product_name: true).page(params[:page]).per(PAGE_LIMIT_NUMBER).order(created_at: :desc)
  #
  #   end
  #
  #   def import
  #     current_user.products.import(params[:file])
  #     redirect_to products_url, notice: '規格品を追加しました'
  #   end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_number, :page, :discontinued, :unit_name, :price, :remark, :unit, :image, :user_id, :created_at, :updated_at, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
